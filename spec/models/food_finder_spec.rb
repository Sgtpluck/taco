require 'spec_helper'
include Yelp::V2::Search::Request

describe FoodFinder do
  describe 'methods' do
    let(:tacos) {FoodFinder.new({ latitude: 47.622,
                                  longitude: -122.313,
                                  term: 'tacos' }) }
    let(:bad_request) {FoodFinder.new({  longitude: -122.313,
                                  term: 'tacos' }) }
  


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
  end
end
