require 'rails_helper'

RSpec.feature 'User signs up', type: :feature do
  let(:user_one) { build(:user_one) }
  let(:user_two) { create(:user_two) }

  scenario 'with valid email, username, password and password confirmation' do
    given_a_user_is_on_the_sign_up_page
    when_they_use_valid_details
    then_they_are_redirected_to_their_profile
  end

  scenario 'with a blank form' do
    given_a_user_is_on_the_sign_up_page
    when_they_click_sign_up
    then_they_see_all_errors
  end

  scenario 'with a password less than six characters long' do
    given_a_user_is_on_the_sign_up_page
    when_they_use_a_password_with_less_than_six_characters
    then_they_see_the_password_length_error
  end

  scenario 'with an account already signed up' do
    given_a_user_is_on_the_sign_up_page
    when_they_use_the_details_of_a_user_already_signed_up
    then_they_are_asked_to_provide_valid_details
  end

  def given_a_user_is_on_the_sign_up_page
    visit new_user_registration_path
  end

  def when_they_use_the_details_of_a_user_already_signed_up
    fill_in('user[email]', with: user_two.email)
    fill_in('user[username]', with: user_two.username)
    fill_in('user[password]', with: user_two.password)
    fill_in('user[password_confirmation]', with: user_two.password)
    find('input#sign-up').click
  end

  def when_they_use_valid_details
    fill_in('user[email]', with: user_one.email)
    fill_in('user[username]', with: user_one.username)
    fill_in('user[password]', with: user_one.password)
    fill_in('user[password_confirmation]', with: user_one.password)
    find('input#sign-up').click
  end

  def when_they_use_a_password_with_less_than_six_characters
    fill_in('user[email]', with: user_one.email)
    fill_in('user[username]', with: user_one.username)
    fill_in('user[password]', with: 'gg')
    fill_in('user[password_confirmation]', with: 'gg')
    find('input#sign-up').click
  end

  def when_they_click_sign_up
    find('input#sign-up').click
  end

  def then_they_are_redirected_to_their_profile
    expect(page).to have_current_path(user_profile_path(User.find_by(email: user_one.email)))
    expect(page).to have_text('Hello, ' + user_one.username)
  end

  def then_they_see_all_errors
    expect(page).to have_current_path(user_registration_path)
    expect(page).to have_text('Please provide a valid email address.')
    expect(page).to have_text('Please provide a valid username.')
    expect(page).to have_text('Please provide a password with a minimum of 6 characters long.')
  end

  def then_they_see_the_password_length_error
    expect(page).to have_current_path(user_registration_path)
    expect(page).to have_text('Please provide a password with a minimum of 6 characters long.')
  end

  def then_they_are_asked_to_provide_valid_details
    expect(page).to have_current_path(user_registration_path)
    expect(page).to have_text('Please provide a valid email address.')
    expect(page).to have_text('Please provide a valid username.')
  end
end
