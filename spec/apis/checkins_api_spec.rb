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

      json = JSON.parse(last_response.body)
    
      expect(last_response.status).to be(200)
    end
  end

end
