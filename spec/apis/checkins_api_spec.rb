require 'spec_helper'

def app
  ApplicationApi
end

describe CheckinsApi do
  include Rack::Test::Methods

  describe 'GET /checkins' do
    it 'returns an individual checkin' do
      checkin = FactoryGirl.create(:checkin)
      get "/checkins/#{checkin.id}"
    
      expect(last_response.status).to eq(200)
    end
  end

  describe 'POST /checkins' do
    it 'creates an individual checkin' do
      post "/checkins/?user_id=1&business_id=1"
      expect(last_response.status).to eq(201)
    end
  end

end
