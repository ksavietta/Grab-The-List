describe GroupUser do
  it { should validate_presence_of :user}

  it { should belong_to(:group)}
  it { should belong_to(:user)}

end