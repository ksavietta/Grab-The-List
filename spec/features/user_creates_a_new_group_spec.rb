require 'spec_helper'

feature 'create a group', %Q{As a user,
I would like to create a new group
so that I can see up-to-date items on my group list} do

  scenario 'user signs in is prompted to create group if does\'t belong to one' do
    user = FactoryGirl.build(:user)
    user.skip_confirmation!
    user.save!

    sign_in_as user

    expect(page).to have_content('Create Group')

    fill_in 'Group Name', with: 'TestTest'
    fill_in 'Description', with: 'Test Description'

    click_button 'Create Group'

    expect(page).to have_content("Group was successfully updated")
  end

  scenario 'user can send links to people they want to add to the group'

  scenario 'user can add items to the main group page'

  scenario 'user can purchase items and move them to a purchase history section'

end