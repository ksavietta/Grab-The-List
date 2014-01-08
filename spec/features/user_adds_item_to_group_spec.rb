require 'spec_helper'

feature 'user adds item to group', %Q{
  As a user I want to add items to a specific group
  So that I can have them shared between other users
  } do

  scenario ' a confirmed user adds item to specific group' do
    user = FactoryGirl.create(:user)

    sign_in_as user
    fill_in 'Name', with: "GroupTest"
    click_on "Create Group"
    expect(page).to have_content("GroupTest")

    click_link "GroupTest"
    expect(page).to have_content("GroupTest")

    fill_in 'New Item:', with: "Eggs"
    click_button "Add Item"

    expect(page).to have_content("Eggs")
  end

end