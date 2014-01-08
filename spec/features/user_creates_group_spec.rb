require 'spec_helper'

feature 'user signs in', %Q{
  As a user I want to sign in
  So that I can see my groups
  } do

  scenario ' a confirmed user signs in without an associated group' do
    user = FactoryGirl.create(:user)

    sign_in_as user

    expect(page).to have_content('Welcome Back!')
    expect(page).to have_content('Sign Out')
    expect(page).to have_content('New Group')

    fill_in 'Name', with: "GroupTest"
    click_on "Create Group"

    expect(page).to have_content("GroupTest")
  end
end