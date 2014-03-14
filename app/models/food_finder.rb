class FoodFinder
  attr_accessor :location_and_type_hash, :food

  def initialize(location_and_type_hash, food)
    @location_and_type_hash = location_and_type_hash
    @food = food
  end

  def client
    Yelp::Base.client
  end


end