require 'spec_helper'

describe Group do
  it { should validate_presence_of :name}

  it { should have_many :group_users }
  it { should have_many(:users).through(:group_users)}

  it {should have_many :items}

  it {should have_many(:purchases).dependent(:destroy)}

  it 'should be able to find groups unpurchased items' do
    group = FactoryGirl.create(:group)
    item = FactoryGirl.create(:item)
    binding.pry
  end

end