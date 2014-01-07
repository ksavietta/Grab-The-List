require 'spec_helper'

feature 'edit list', %Q{As a user,
I would like to edit a list
so that I can see updated lists on my account.} do

  scenario 'user visits list page and selects list' do
    user = FactoryGirl.create(:user)
    list = FactoryGirl.create(:list)

    sign_in_as user

    click_link list.name
    expect(page).to have_content(list.name)

    click_link 'Edit List Info'
    expect(page).to have_content("Make Changes to")
    fill_in 'Name', with: 'TestTest'
    fill_in 'Description', with: 'Test Description'
    fill_in 'Price', with: '1'

    click_button 'Update List'

    expect(page).to have_content("List was successfully updated")
  end

end