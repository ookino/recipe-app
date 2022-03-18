class ShoppingListsController < ApplicationController
  def sum(array)
    sum = 0
    array.each do |number|
      sum += number.quantity * number.food.Price
    end
    sum
  end

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = RecipeFood.all
    @food = Food.all
    @total_price = sum(@recipe.recipe_foods.includes([:food]))
  end
end
