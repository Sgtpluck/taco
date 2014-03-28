require 'spec_helper'

describe FoodController do
  before do
    request.env['HTTP_ACCEPT'] = 'application/json'
  end

  describe 'POST "tacos"' do
    it "should be successful" do
      VCR.use_cassette 'post' do
        post :all_foods, longitude: -122.320936, latitude: 47.6236, path: 'tacos'
      end

      expect(response).to be_successful
      expect(assigns(:closest_food)).to be_an_instance_of Hash
    end
  end
end
