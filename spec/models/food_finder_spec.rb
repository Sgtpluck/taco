require 'spec_helper'
include Yelp::V2::Search::Request

describe FoodFinder do
  describe 'methods' do
    let(:tacos) {FoodFinder.new({ latitude: 47.622,
                                  longitude: -122.313,
                                  food: 'tacos' }) }
    let(:bad_request) {FoodFinder.new({  longitude: -122.313,
                                  food: 'tacos' }) }
  
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

    describe 'sorted_google_response' do
      it 'should return an array' do
        response = VCR.use_cassette 'google_places' do
          tacos.sorted_google_response
        end

        expect(response).to be_an_instance_of Array
      end
    end

    describe 'closest_google' do
      it 'should return the first restaurant returned in the google places search' do
        response = VCR.use_cassette 'google_places' do
          tacos.sorted_google_response
        end
        closest_taco = VCR.use_cassette 'google_places' do
          tacos.closest_google
        end

        expect(closest_taco). to eq response.first
      end
    end

    describe 'closest' do
      it 'should return the first element of the sorted array if there is at least one response from yelp' do
        response = VCR.use_cassette 'taco' do
           tacos.sorted_yelp_response
         end
        close_taco = VCR.use_cassette 'taco' do
            tacos.closest
          end

        expect(close_taco).to eq response.first
      end

      # pending until swap to Google Places API
      xit 'should return an apology if there are not tacos found via the search' do
        response = VCR.use_cassette 'error' do
            bad_request.sorted_yelp_response
          end
        expect(response).to eq "Sorry, I can't find any tacos for you."
      end
    end
  end
end
