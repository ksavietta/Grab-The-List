describe GroupUser do
  it { should validate_presence_of :group}
  it { should validate_presence_of :user}

  it { should belong_to(:group).dependent(:destroy) }
  it { should belong_to(:user).dependent(:destroy) }

end
