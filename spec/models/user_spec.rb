require 'spec_helper'

describe User do

  it 'can be created' do
    user = create :user
    expect(user).to_not be_nil
  end

  context 'invalid create request' do
    it 'cannot be created without a name' do
      expect(FactoryGirl.build(:user, name: nil)).to_not be_valid
    end

    it 'cannot be created without a email' do
      expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
    end
  end

end
