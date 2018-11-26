require 'application_system_test_case'

class SigningUpTest < ApplicationSystemTestCase
  # Signing up
  def setup
    @user = build(:user)
    @other_user = create(:user, email: 'monica@friends.com', username: 'monica')
    visit new_user_registration_path
  end
  
  test 'can sign up with valid email and password' do
    fill_in('user[email]', with: @user.email)
    fill_in('user[username]', with: @user.username)
    fill_in('user[password]', with: @user.password)
    fill_in('user[password_confirmation]', with: @user.password)
    find('input#sign-up').click
    assert has_current_path?(user_profile_path(User.find_by(email: @user.email)))
    assert_text 'Hello, ' + @user.username
  end

  test 'cannot sign up if all fields are blank' do
    find('input#sign-up').click
    assert has_current_path?(user_registration_path)
    assert_text 'Please provide a valid email address.'
    assert_text 'Please provide a valid username.'
    assert_text 'Please provide a password with a minimum of 6 characters long.'
  end

  test 'cannot sign up if password is filled but is not 6 characters long' do
    fill_in('user[email]', with: @user.email)
    fill_in('user[username]', with: @user.username)
    fill_in('user[password]', with: "a")
    fill_in('user[password_confirmation]', with: "a")
    find('input#sign-up').click
    assert has_current_path?(user_registration_path)
    assert_text 'Please provide a password with a minimum of 6 characters long.'
  end

  test 'cannot sign up again' do
    fill_in('user[email]', with: @other_user.email)
    fill_in('user[username]', with: @other_user.username)
    fill_in('user[password]', with: @other_user.password)
    fill_in('user[password_confirmation]', with: @other_user.password)
    find('input#sign-up').click
    assert has_current_path?(user_registration_path)
    assert_text 'Please provide a valid email address.'
    assert_text 'Please provide a valid username.'
  end
end
