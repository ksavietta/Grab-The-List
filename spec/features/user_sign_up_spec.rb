require 'spec_helper'

feature 'sign up', %Q{
  As an unauthenticated user
  I want to sign up
  So that I can track grocery lists
} do

  scenario 'specifying valid and required information' do
    visit new_user_registration_path
    fill_in 'First Name', with: 'John'
    fill_in 'Last Name', with: 'Doe'
    fill_in 'Email', with: 'user@example.com'
    fill_in "user_password", with: 'password'
    fill_in "Password Confirmation", with: 'password'
    click_button 'Sign Up'

    expect(page).to have_content("message with a confirmation")
  end

  scenario 'required information is not supplied' do
    visit root_path
    click_link 'Sign Up'

    click_button 'Sign Up'
    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Sign Out")
  end

  scenario 'password confirmation does not match confirmation' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'user_password', with: 'password'
    fill_in 'Password Confirmation', with: 'notthesame'

    click_button 'Sign Up'
    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content("Sign Out")
  end

end
