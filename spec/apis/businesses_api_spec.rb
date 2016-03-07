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
      business_name = JSON.parse(last_response.body)['data']['name']
    
      expect(last_response.status).to be(200)
      expect(business_name).to eq('Company_name')
    end
  end

  describe 'POST /businesses' do
    it 'creates a new business' do
      business = FactoryGirl.build(:business)

      post "/businesses/?name=#{business.name}&phone_number=#{business.phone_number}&address=#{business.address}"
      newly_created_name = JSON.parse(last_response.body)['data']['name']

      expect(newly_created_name).to eq('Company_name')
    end
  end

  describe 'PUT /businesses' do
    it 'updates a business' do
      business = FactoryGirl.create(:business, name: "Wrong name")

      put "/businesses/#{business.id}/?name=Correct Name"
      updated_name = JSON.parse(last_response.body)['data']['name']
      expect(updated_name).to eq('Correct Name')
    end
  end

end
