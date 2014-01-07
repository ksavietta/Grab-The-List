require 'spec_helper'

feature 'user signs in', %Q{
  As a user I want to sign in
  So that I can see my lists
  } do

  scenario ' an existing user specifies a valid email and password' do
    user = FactoryGirl.create(:user)
    list = FactoryGirl.create(:list)

    sign_in_as user


    expect(page).to have_content('Welcome Back!')
    expect(page).to have_content('Sign Out')
  end

  scenario 'a nonexistant email and password is supplied' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path
    click_link 'Sign In'
    fill_in 'Email', with: 'notreal@example.com'
    fill_in 'Password', with: 'notarealpassword'
    click_button 'Sign In'

    expect(page).to have_content('Invalid email or password')
    expect(page).to_not have_content('Welcome Back!')
    expect(page).to_not have_content('Sign Out')

  end

  scenario 'a exisiting email with the wrong password is denied access' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'nottherightpassword'
    click_button 'Sign In'

    expect(page).to have_content('Invalid email or password')
    expect(page).to_not have_content('Welcome Back!')
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'an already authenticated user cannot re-sign in' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content('Sign Out')
    expect(page).to_not have_content('Sign In')

    visit new_user_session_path
    expect(page).to have_content('You are already signed in.')
  end

end