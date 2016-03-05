require 'spec_helper'

describe Checkin do

  it 'can be created' do
    checkin = create :checkin
    expect(checkin).to_not be_nil
  end

  it 'cannot be created without a valid user_id' do
    checkin = FactoryGirl.build(:checkin, user_id: nil)
    expect(checkin).to_not be_valid
  end

  it 'cannot be created without a valid business_id' do
    checkin = FactoryGirl.build(:checkin, business_id: nil)
    expect(checkin).to_not be_valid
  end

  it 'will not allow two identical checkins less than an hour apart' do
      checkin1 = FactoryGirl.create(:checkin, created_at: Time.now)
      checkin2 = FactoryGirl.build(:checkin, created_at: (Time.now + 30.minutes))
      checkin2.valid?

      expect(checkin2.valid?).to eq(false)
    end

    it 'will allow two identical checkins MORE than an hour apart' do
      checkin1 = FactoryGirl.create(:checkin, created_at: Time.now)
      checkin2 = FactoryGirl.build(:checkin, created_at: (Time.now + 70.minutes))
      checkin2.valid?

      expect(checkin2.valid?).to eq(true)
    end

end
