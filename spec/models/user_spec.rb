require 'spec_helper'

describe User do
  it {should have_valid(:first_name).when('John', 'Sally')}
  it {should_not have_valid(:first_name).when(nil, '')}

  it {should have_valid(:last_name).when('Black', 'White')}
  it {should_not have_valid(:last_name).when(nil, '')}

  it {should have_valid(:email).when('user@example.com', 'another@gmail.com')}
  it {should_not have_valid(:email).when(nil, '', 'user@com', 'user', 'user@')}

  it 'has a matching password confirmation for the password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'anotherpassword'
    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end

  describe 'admin checks' do
    it 'is not an admin if the role is not admin' do
      user = FactoryGirl.build(:user)
      expect(user.is_admin?).to_not be_true
    end

    it 'is an admin if the role is admin' do
      user = FactoryGirl.build(:user, role: 'admin')
      expect(user.is_admin?).to be_true
    end
  end

  it { should have_many :group_users }
  it { should have_many(:groups).through(:group_users)}

  it { should have_many(:items).through(:groups)}
end
