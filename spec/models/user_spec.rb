require 'spec_helper'

describe User do

  it 'can be created' do
    user = create :user
    expect(user).to_not be_nil
  end

end
