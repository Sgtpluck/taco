require 'spec_helper'
include Yelp::V2::Search::Request

describe FoodFinder do
  describe 'methods' do
    let(:tacos) {FoodFinder.new({ latitude: 47.622, longitude: -122.313 },
                                 'taco')}
  
    describe 'client' do
      it 'should create a Yelp Client object' do
        expect(tacos.client).to be_an_instance_of(Yelp::Client)
      end
    end

    describe 'request' do
      it 'should create a geopoint request object' do
        expect(tacos.food_and_location_request).to be_an_instance_of(Yelp::V2::Search::Request::GeoPoint)
      end
    end

    describe 'sorted_yelp_response' do

      it 'should return an array and sort it by distance' do
        response = VCR.use_cassette 'taco' do
           tacos.sorted_yelp_response
         end

         expect(response).to be_an_instance_of Array
         expect(response.first['distance']).to be < response.last['distance']
      end
    end

    describe 'closest' do
      it 'should return the first element of the sorted array' do
        response = VCR.use_cassette 'taco' do
           tacos.sorted_yelp_response
         end
        close_taco = VCR.use_cassette 'taco' do
            tacos.closest
          end

        expect(close_taco).to eq response.first
      end
    end
  end
end

 # response = client.search(request)
#   <!--  request = GeoPoint.new(:term => 'tacos', :latitude => 47.623, :longitude => -122.3209) 
# closest = response['businesses'].map {|business| [business['distance'], business['name'], business['location']['display_address'].join(" ")] }.sort.first
# -->