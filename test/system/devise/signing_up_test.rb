require 'application_system_test_case'

class SigningUpTest < ApplicationSystemTestCase
  # Signing up
  def setup
    @chandler = build(:chandler)
    @monica = create(:monica)
    visit new_user_registration_path
  end
  
  test 'can sign up with valid email and password' do
    fill_in('user[email]', with: @chandler.email)
    fill_in('user[username]', with: @chandler.username)
    fill_in('user[password]', with: @chandler.password)
    fill_in('user[password_confirmation]', with: @chandler.password)
    find('input#sign-up').click
    assert has_current_path?(user_profile_path(User.find_by(email: @chandler.email)))
    assert_text 'Hello, ' + @chandler.username
  end

  test 'cannot sign up if all fields are blank' do
    find('input#sign-up').click
    assert has_current_path?(user_registration_path)
    assert_text 'Please provide a valid email address.'
    assert_text 'Please provide a valid username.'
    assert_text 'Please provide a password with a minimum of 6 characters long.'
  end

  test 'cannot sign up if password is filled but is not 6 characters long' do
    fill_in('user[email]', with: @chandler.email)
    fill_in('user[username]', with: @chandler.username)
    fill_in('user[password]', with: "a")
    fill_in('user[password_confirmation]', with: "a")
    find('input#sign-up').click
    assert has_current_path?(user_registration_path)
    assert_text 'Please provide a password with a minimum of 6 characters long.'
  end

  test 'cannot sign up again' do
    fill_in('user[email]', with: @monica.email)
    fill_in('user[username]', with: @monica.username)
    fill_in('user[password]', with: @monica.password)
    fill_in('user[password_confirmation]', with: @monica.password)
    find('input#sign-up').click
    assert has_current_path?(user_registration_path)
    assert_text 'Please provide a valid email address.'
    assert_text 'Please provide a valid username.'
  end
end
