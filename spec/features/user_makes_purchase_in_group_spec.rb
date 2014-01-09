require 'spec_helper'

feature 'user makes a purchase', %Q{
  As a user I want to make a purchase for a group I'm in
  So that I can remove those items from the "to be purchased" list
  } do

  scenario ' a confirmed user makes a purchase from a specific group' do
    user = FactoryGirl.create(:user)

    sign_in_as user
    fill_in 'Name', with: "GroupTest"
    click_on "Create Group"
    expect(page).to have_content("GroupTest")
    click_link "GroupTest"
    fill_in "New Item:", with: "Eggs"
    click_button "Add Item"
    fill_in "New Item:", with: "Milk"
    click_button "Add Item"

    click_button "Make Purchase"
    expect(page).to have_content("Which items are you buying?")
    check_box "Eggs"
    click_button "Purchase"
    expect(page).to have_content("Milk")
    expect(page).to_not have_content("Eggs")
  end
end