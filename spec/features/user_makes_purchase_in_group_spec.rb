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

    click_link "Make a Purchase"
    expect(page).to have_content("Make a purchase for GroupTest")
    fill_in "Cost", with: "23"
    check "Eggs"
    click_button "Create Purchase"
    expect(page).to have_content("Eggs")
    expect(page).to_not have_content("Milk")
  end
end