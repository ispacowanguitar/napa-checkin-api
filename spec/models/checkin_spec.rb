require 'spec_helper'

describe Checkin do

  it 'can be created' do
    checkin = create :checkin
    expect(checkin).to_not be_nil
  end

  context 'failed create request' do
    it 'cannot be created without a valid user_id' do
      checkin = FactoryGirl.build(:checkin, user_id: nil)
      expect(checkin).to_not be_valid
    end

    it 'cannot be created without a valid business_id' do
      checkin = FactoryGirl.build(:checkin, business_id: nil)
      expect(checkin).to_not be_valid
    end
  end

  context 'when checks in twice' do
    it 'will not allow two identical checkins LESS than an hour apart' do
      checkin1 = FactoryGirl.create(:checkin)

      pretend_now_is(Time.now + 55.minutes) do
        checkin2 = FactoryGirl.build(:checkin)
        expect(checkin2.valid?).to eq(false)
      end
    end

    it 'will allow two identical checkins MORE than an hour apart' do
      checkin1 = FactoryGirl.create(:checkin)

      pretend_now_is(Time.now + 65.minutes) do
        checkin2 = FactoryGirl.build(:checkin)
        expect(checkin2.valid?).to eq(true)
      end
    end
  end
end
