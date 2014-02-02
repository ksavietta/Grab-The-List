require 'spec_helper'

describe Group do
  it { should validate_presence_of :name}

  it { should have_many :group_users }
  it { should have_many(:users).through(:group_users)}

  it {should have_many :items}

  it {should have_many(:purchases).dependent(:destroy)}

  it 'should be able to find groups unpurchased and purchased items' do
    # group = FactoryGirl.create(:group)
    # user = FactoryGirl.create(:user)
    membership = FactoryGirl.create(:group_user)
    group = membership.group
    user = membership.user
    purchased_items = FactoryGirl.create_list(:item, 2, group: group, purchase_id:1)
    unpurchased_items = FactoryGirl.create_list(:item, 3, group: group)

    expect(purchased_items).to eq(group.purchased_items)
    expect(unpurchased_items).to eq(group.unpurchased_items)
  end

end
