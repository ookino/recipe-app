class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.new(food_params)
    if @food.save
      redirect_to foods_path,
                  notice: 'New food was added successfully.'

    else
      render :new, alert: 'Failed to add food'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    authorize! :destroy, @food
    if @food.delete
      redirect_to root_path,
                  notice: 'Food removed succesfully '
    else
      render :new, alert: 'Could not delete'
    end
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
