require 'spec_helper'
require 'factory_girl'

def app
  ApplicationApi
end

describe BusinessesApi do
  include Rack::Test::Methods

  describe 'GET /businesses' do
    it 'returns an individual business' do
      business = FactoryGirl.create(:business)

      get "/businesses/#{business.id}"
      json = JSON.parse(last_response.body)
    
      expect(last_response.status).to be(200)
      expect(json['data']['name']).to eq('Company_name')
    end
  end

  describe 'POST /businesses' do
    it 'creates a new business' do
      business = FactoryGirl.build(:business)

      post "/businesses/?name=#{business.name}&phone_number=#{business.phone_number}&address=#{business.address}"
      json = JSON.parse(last_response.body)

      expect(json['data']['name']).to eq('Company_name')
    end
  end

end
