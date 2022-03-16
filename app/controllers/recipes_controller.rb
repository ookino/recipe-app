class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  # GET /recipes or /recipes.json
  def index
    @recipes = current_user.recipes
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe = set_recipe
    @recipe_foods = @recipe.recipe_foods
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # # GET /recipes/1/edit
  # def edit; end

  # POST /recipes or /recipes.json
  def create
    add_recipe = current_user.recipes.new(recipe_params)
    if add_recipe.save
      redirect_to recipe_url(@recipe),
                  notice: 'Recipe was added successfully.'

    else
      render :new, alert: 'Failed to add recipe'
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  # def update
  #   respond_to do |format|
  #     if @recipe.update(recipe_params)
  #       format.html do
  #         redirect_to recipe_url(@recipe),
  #                     notice: 'Recipe was successfully updated.'
  #       end
  #       format.json { render :show, status: :ok, location: @recipe }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json do
  #         render json: @recipe.errors, status: :unprocessable_entity
  #       end
  #     end
  #   end
  # end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html do
        redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params
      .require(:recipe)
      .permit(:name, :preperation_time, :cooking_time, :description, :public)
  end
end
