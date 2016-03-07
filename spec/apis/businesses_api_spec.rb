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

      expect(response_code).to eq(200)
      expect(parsed_response.data.name).to eq('Company_name')
    end
  end

  describe 'POST /businesses' do
    it 'creates a new business' do
      business = FactoryGirl.build(:business)

      post "/businesses/?name=#{business.name}&phone_number=#{business.phone_number}&address=#{business.address}"

      expect(response_code).to eq(201)
      expect(parsed_response.data.name).to eq('Company_name')
    end
  end

  describe 'PUT /businesses' do
    it 'updates a business name' do
      business = FactoryGirl.create(:business, name: "Wrong name")

      put "/businesses/#{business.id}/?name=Correct Name"

      expect(response_code).to eq(200)
      expect(parsed_response.data.name).to eq('Correct Name')
    end
  end

end
