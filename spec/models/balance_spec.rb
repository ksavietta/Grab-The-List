require 'spec_helper'

describe Balance do
  it {should belong to :group_user}

  it 'should be updated when a purchase is made' do
    user1 = FactoryGirl.create(:user, :with_group)
    user1_group_user = user1.group_users.first

    user2 = FactoryGirl.create(:user)
    user2.groups << user1_group_user.group

    expect(user1.find_balance(user2).amount).to eq(0)

    # user1 makes a purchase
    purchase = FactoryGirl.create(:purchase, group_user: user1_group_user)

    expect(user1.find_balance(user2).amount).to eq(5)
  end
end




