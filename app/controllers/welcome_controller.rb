class WelcomeController < ApplicationController
  def index
    @client = Yelp::Base.client
  end
end
