class FoodController < ApplicationController

  def taco
    @closest_taco = FoodFinder.new(params, 'taco').closest
  end

end