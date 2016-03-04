require 'spec_helper'

describe Business do

  it 'can be created' do
    business = create :business
    expect(business).to_not be_nil
  end

  it 'cannot be created without a name' do
    expect(FactoryGirl.build(:business, name: nil)).to_not be_valid
  end

  it 'cannot be created without a phone_number' do
    expect(FactoryGirl.build(:business, phone_number: nil)).to_not be_valid
  end

  it 'cannot be created without an address' do
    expect(FactoryGirl.build(:business, address: nil)).to_not be_valid
  end

end
