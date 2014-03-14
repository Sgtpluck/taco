class FoodFinder
  include Yelp::V2::Search::Request
  attr_accessor :location_and_type_hash, :food

  def initialize(location_and_type_hash, food)
    @location_and_type_hash = location_and_type_hash
    @food = food
  end

  def client
    Yelp::Base.client
  end

  def food_and_location_request
    GeoPoint.new(:term => @food, :latitude => location_and_type_hash[:latitude], :longitude => location_and_type_hash[:longitude], :radius => 2)
  end

  def yelp_response
    client.search(food_and_location_request)['businesses'].sort_by { |business, distance| business['distance'] }
  end

  def closest
    yelp_response.first
  end


end