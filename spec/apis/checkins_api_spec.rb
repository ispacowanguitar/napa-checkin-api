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
    
      expect(last_response.status).to eq(200)
    end
  end

  describe 'POST /checkins' do
    it 'will not allow two identical checkins less than an hour apart' do
      checkin1 = FactoryGirl.create(:checkin, created_at: Time.now)
      checkin2 = FactoryGirl.build(:checkin, created_at: (Time.now + 30.minutes))
      checkin2.valid?

      expect(checkin2.valid?).to eq(false)
    end
  end

end
