require 'spec_helper'

describe UserCheckin do

  it 'can be created' do
    user_checkin = create :user_checkin
    expect(user_checkin).to_not be_nil
  end

  it 'needs tests to be written!' do
    pending('write tests for UserCheckin!')
  end

end
