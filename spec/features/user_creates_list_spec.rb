require 'spec_helper'

feature 'create list', %Q{As a user,
I would like to create a list and optionally add items to it
so that I can add lists to my account.} do

  scenario 'user visits new list creation page' do
    user = FactoryGirl.create(:user)
    list = FactoryGirl.create(:list)

    sign_in_as user

    click_button 'New List'

    expect(page).to have_content('New List')
  end

  scenario 'user creates new list' do
    user = FactoryGirl.create(:user)
    list = FactoryGirl.create(:list)

    sign_in_as user

    visit new_list_path
    fill_in 'Name', with: 'Test'
    fill_in 'Description', with: 'Test Description'
    fill_in 'Price', with: '12.00'
    click_button 'Create List'

    expect(page).to have_content('List was successfully created')
  end

  scenario 'user tries to create list without filling in field' do
    user = FactoryGirl.create(:user)
    list = FactoryGirl.create(:list)

    sign_in_as user

    visit new_list_path

    click_button 'Create List'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('List was successfully created')
  end

end