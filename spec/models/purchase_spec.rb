require 'spec_helper'

describe Purchase do
  it { should validate_presence_of :cost}

  it { should_not have_valid(:cost).when("this is a string, not a price")}

  it { should have_many(:items).dependent(:destroy)}
  it { should belong_to(:user)}
  it { should belong_to(:group)}
end

