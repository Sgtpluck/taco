require 'spec_helper'
include Yelp::V2::Search::Request

describe FoodFinder do
  describe 'methods' do
    let(:tacos) { FoodFinder.new({ latitude: 47.622,
                                  longitude: -122.313,
                                  path: 'tacos' }) }
    let(:bad_request) { FoodFinder.new({  longitude: -122.313,
                                  path: 'tacos' }) }
    let(:curse_request) { FoodFinder.new({ latitude: 47.622,
          longitude: -122.313,
          path: 'fuck' }) }
  


    describe 'sorted_google_response' do
      it 'should return an array' do
        response = VCR.use_cassette 'google_places' do
          tacos.sorted_google_response
        end

        expect(response).to be_an_instance_of Array
      end
    end

    describe 'closest_google' do
      it 'should return the first restaurant returned in the google places search if the search is clean' do
        response = VCR.use_cassette 'google_places' do
          tacos.sorted_google_response
        end
        closest_taco = VCR.use_cassette 'google_places' do
          tacos.closest_google
        end

        expect(closest_taco). to eq response.first
      end
    end

    describe 'curse_words?' do
      it 'should return true if the query is a curse word' do


        expect(curse_request.curse_words?).to be true
      end

       it 'should return false if the query is clean' do

        expect(tacos.curse_words?).to be false
      end
    end
  end
end
