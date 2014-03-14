class FoodFinder
  attr_accessor :location_and_type_hash, :food

  def initialize(location_and_type_hash, food)
    @location_and_type_hash = location_and_type_hash
    @food = food
  end

  def client
    Yelp::Base.client
  end

  def request
  end

#   <!--  request = GeoPoint.new(:term => 'tacos', :latitude => 47.623, :longitude => -122.3209) 
# closest = response['businesses'].map {|business| [business['distance'], business['name'], business['location']['display_address'].join(" ")] }.sort.first
# -->


end