require 'spec_helper'

describe WelcomeController do
    describe "GET 'index'" do
    let(:event){ create(:event) }

    it 'should be successful' do
      get :index
      expect(response.status).to eq 200
    end
  end
end
