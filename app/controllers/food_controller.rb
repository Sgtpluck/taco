class FoodController < ApplicationController

  def all_foods
    @closest_food = FoodFinder.new(params).closest_google

    respond_to do |format|
      format.json { render json: @closest_food, status: :ok }
    end
  end

end

# HTTParty.post("http://localhost:3000/taco.json", body: options.to_json, headers: {'Content-Type' => 'application/json'})

# HTTParty.post("http://www.taco911.me/taco.json", body: options.to_json, headers: {'Content-Type' => 'application/json'})
# options = {latitude: 47.622, longitude: -122.313}