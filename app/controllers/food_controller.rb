class FoodController < ApplicationController

  def taco
    @closest_taco = FoodFinder.new(params, 'taco').closest

    respond_to do |format|
        format.json { render json: @closest_taco, status: :ok }
    end
  end

end

# HTTParty.post("http://localhost:3000/taco.json", body: options.to_json, headers: {'Content-Type' => 'application/json'})
