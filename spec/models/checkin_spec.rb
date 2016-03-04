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
end
