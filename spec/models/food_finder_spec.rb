require 'spec_helper'

describe FoodFinder do
  describe 'methods' do
  
    describe 'client' do
      it 'should create a Yelp Client object' do
        tacos = FoodFinder.new({ lat: 47.622, long: -122.313 },
                                 'taco')
        expect(tacos.client).to be_an_instance_of(Yelp::Client)
      end
    end
  end
end