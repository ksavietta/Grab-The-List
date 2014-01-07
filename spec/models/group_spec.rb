require 'spec_helper'

describe Group do
  it { should validate_presence_of :name}

  it { should have_many :group_users }
  it { should have_many(:users).through(:group_users)}

end
