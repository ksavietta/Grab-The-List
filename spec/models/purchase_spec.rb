require 'spec_helper'

describe Purchase do
  it { should validate_presence_of :cost}

  it { should_not have_valid(:cost).when("this is a string, not a price")}

  it { should have_many(:items).dependent(:destroy)}
  it { should belong_to(:user)}
  it { should belong_to(:group)}
  it { should belong_to(:group_user)}

  it 'should have a formatted date' do
    purchase = FactoryGirl.create(:purchase)
    binding.pry
    expect(purchase.formatted_date).to eq(1)
  end
end

