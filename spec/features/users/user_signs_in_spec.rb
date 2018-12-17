require 'rails_helper'

RSpec.feature 'User signs in', type: :feature do
  let(:user_one) { create(:user_one) }

  scenario 'with valid email and password' do
    given_a_user_is_on_the_sign_in_page
    when_they_use_valid_email_and_password
    then_they_are_redirected_to_their_profile
  end

  scenario 'with valid username and password' do
    given_a_user_is_on_the_sign_in_page
    when_they_use_valid_username_and_password
    then_they_are_redirected_to_their_profile
  end

  scenario 'with valid email and invalid password' do
    given_a_user_is_on_the_sign_in_page
    when_they_use_valid_email_and_invalid_password
    then_they_see_an_error
  end

  scenario 'with valid username and invalid password' do
    given_a_user_is_on_the_sign_in_page
    when_they_use_valid_username_and_invalid_password
    then_they_see_an_error
  end

  scenario 'with a blank form' do
    given_a_user_is_on_the_sign_in_page
    when_they_click_sign_in
    then_they_see_an_error
  end

  def given_a_user_is_on_the_sign_in_page
    visit new_user_session_path
  end

  def when_they_use_valid_email_and_password
    fill_in('user[login]', with: user_one.email)
    fill_in('user[password]', with: user_one.password)
    click_on('Enter the Shadow Realm')
  end

  def when_they_use_valid_username_and_password
    fill_in('user[login]', with: user_one.username)
    fill_in('user[password]', with: user_one.password)
    click_on('Enter the Shadow Realm')
  end

  def when_they_use_valid_email_and_invalid_password
    fill_in('user[login]', with: user_one.email)
    fill_in('user[password]', with: "notthepassword")
    click_on('Enter the Shadow Realm')
  end

  def when_they_use_valid_username_and_invalid_password
    fill_in('user[login]', with: user_one.username)
    fill_in('user[password]', with: "notthepassword")
    click_on('Enter the Shadow Realm')
  end

  def when_they_click_sign_in
    click_on('Enter the Shadow Realm')    
  end

  def then_they_are_redirected_to_their_profile
    expect(page).to have_current_path(user_profile_path(user_one))
    expect(page).to have_text('Hello, ' + user_one.username)
  end

  def then_they_see_an_error
    within('h3.card-title') do
      expect(page).to have_text('Sign In', exact: true)
    end
    within('.alert') do
      expect(page).to have_text('Sorry! Invalid email address, username or password.')
    end
    expect(page).to have_current_path(new_user_session_path)
  end
end
