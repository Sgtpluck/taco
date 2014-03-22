class FoodFinder
  include Yelp::V2::Search::Request
  attr_accessor :location_and_type_hash

  def initialize(location_and_type_hash)
    @location_and_type_hash = location_and_type_hash
  end

  def client
    Yelp::Base.client
  end

  def food_and_location_request
    GeoPoint.new(:term => @location_and_type_hash[:path],
                 :latitude => @location_and_type_hash[:latitude],
                 :longitude => @location_and_type_hash[:longitude],
                 :radius => 2)
  end

  def sorted_yelp_response
    client.search(food_and_location_request)['businesses'].sort_by { |business, distance| business['distance'] }
  end

  def closest
    sorted_yelp_response.first 
  end
end
