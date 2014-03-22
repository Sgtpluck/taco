require 'spec_helper'

describe FoodController do
  describe 'POST "tacos"' do
    it "should be successful" do
      post :all_foods, longitude: -122.320936, latitude: 47.6236, path: 'tacos'
      
      expect(response).to be_successful
    end
  end
end
