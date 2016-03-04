require 'spec_helper'

describe Business do

  it 'can be created' do
    business = create :business
    expect(business).to_not be_nil
  end

end
