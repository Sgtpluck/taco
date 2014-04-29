require 'spec_helper'

describe WelcomeController do
    describe "GET 'index'" do

    it 'should be successful' do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'other'" do

    it 'should be successful' do
      get :other
      expect(response.status).to eq 200
    end
  end
end
