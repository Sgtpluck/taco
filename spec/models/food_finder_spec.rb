require 'spec_helper'
include Yelp::V2::Search::Request

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
        expect(tacos.food_and_location_request).to be_an_instance_of(Yelp::V1::Review::Request::GeoPoint)
      end
    end

    describe 'sorted_response' do
      let(:response) { { "distance"=>271.51581067773924, "mobile_url"=>"http://m.yelp.com/biz/tacos-chukis-seattle", "rating_img_url"=>"http://s3-media2.ak.yelpcdn.com/assets/2/www/img/99493c12711e/ico/stars/v1/stars_4_half.png", "review_count"=>260, "name"=>"Tacos Chukis", "location"=>{"display_address"=>["219 Broadway E", "(b/t John St & Olive Way)", "Capitol Hill", "Seattle, WA 98102"], "neighborhoods"=>["Capitol Hill"], "postal_code"=>"98102", "country_code"=>"US", "address"=>["219 Broadway E"], "state_code"=>"WA"}, "phone"=>"2063284447", "image_url"=>"http://s3-media3.ak.yelpcdn.com/bphoto/aMcEM2eXL2esBRRCflSctQ/ms.jpg", "categories"=>[["Mexican", "mexican"]], "is_closed"=>false, "rating_img_url_small"=>"http://s3-media2.ak.yelpcdn.com/assets/2/www/img/a5221e66bc70/ico/stars/v1/stars_small_4_half.png" } }
    end



  end
end

 # response = client.search(request)
#   <!--  request = GeoPoint.new(:term => 'tacos', :latitude => 47.623, :longitude => -122.3209) 
# closest = response['businesses'].map {|business| [business['distance'], business['name'], business['location']['display_address'].join(" ")] }.sort.first
# -->