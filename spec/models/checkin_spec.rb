require 'spec_helper'

describe Checkin do

  it 'can be created' do
    checkin = create :checkin
    expect(checkin).to_not be_nil
  end

end
