require 'spec_helper'

describe GroupUser do
  it { should validate_presence_of :user}

  it { should belong_to(:group)}
  it { should belong_to(:user)}

  it {should have_many(:purchases)}

  it {should have_many(:balances)}

  it 'should query an existing user by email using virtual attribute setter' do
    user2 = FactoryGirl.create(:user)
    membership = FactoryGirl.create(:group_user)

    membership.email_address=(user2.email)
    expect(membership.group.users.count).to_not eq(2)
  end

  it 'should not set a non-existant email to a membership' do
    user2 = FactoryGirl.create(:user)
    membership = FactoryGirl.create(:group_user)

    membership.email_address=("notarealaddress@example.com")
    expect(membership.group.users.count).to eq(1)
  end

end
