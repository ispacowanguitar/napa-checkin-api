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

  it 'will not allow two identical checkins LESS than an hour apart' do
      pretend_now_is(Time.now) do
        checkin1 = FactoryGirl.create(:checkin)
      end

      pretend_now_is(Time.now + 59.minutes) do
        checkin2 = FactoryGirl.build(:checkin)
        checkin2.valid?
        expect(checkin2.valid?).to eq(false)
      end
    end

    it 'will allow two identical checkins MORE than an hour apart' do

      pretend_now_is(Time.now) do
        checkin1 = FactoryGirl.create(:checkin)
      end

      pretend_now_is(Time.now + 61.minutes) do
        checkin2 = FactoryGirl.build(:checkin)
        checkin2.valid?
        expect(checkin2.valid?).to eq(true)
      end
    end

end
