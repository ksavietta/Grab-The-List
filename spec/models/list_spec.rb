require 'spec_helper'

describe List do
  it { should validate_presence_of :name}
  it { should validate_presence_of :state}

  it { should_not have_valid(:price).when("this is a string, not a price")}

  it { should have_many(:items).dependent(:destroy)}


  it 'should include an optional claimed purchaser_id'
  it 'shoudl belong to a group'
end

