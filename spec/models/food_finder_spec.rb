require 'spec_helper'
include Yelp::V1::Review::Request

describe FoodFinder do
  describe 'methods' do
    let(:tacos) {FoodFinder.new({ lat: 47.622, long: -122.313 },
                                 'taco')}
  
    describe 'client' do
      it 'should create a Yelp Client object' do
        expect(tacos.client).to be_an_instance_of(Yelp::Client)
      end
    end

    describe 'request' do
      it 'should create a geopoint request object' do
        expect(tacos.request).to be_an_instance_of(Yelp::V1::Review::Request::GeoPoint)
      end
    end

  end
end

#   <!--  request = GeoPoint.new(:term => 'tacos', :latitude => 47.623, :longitude => -122.3209) 
# closest = response['businesses'].map {|business| [business['distance'], business['name'], business['location']['display_address'].join(" ")] }.sort.first
# -->