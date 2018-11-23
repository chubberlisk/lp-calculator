require 'application_system_test_case'

class SigningInTest < ApplicationSystemTestCase
  # Signing in
  def setup
    @user = create(:user)
    visit new_user_session_path
  end

  test 'can sign in with valid email and password' do
    fill_in('user[login]', with: @user.email)
    fill_in('user[password]', with: @user.password)
    click_on('Enter the Shadow Realm')
    assert has_current_path?(user_profile_path(@user))
    assert_text 'I\'m ' + @user.username
  end

  test 'can sign in with valid username and password' do
    fill_in('user[login]', with: @user.username)
    fill_in('user[password]', with: @user.password)
    click_on('Enter the Shadow Realm')
    assert has_current_path?(user_profile_path(@user))
    assert_text 'I\'m ' + @user.username
  end

  test 'cannot sign in with valid email and invalid password' do
    fill_in('user[login]', with: @user.email)
    fill_in('user[password]', with: "notthepassword")
    click_on('Enter the Shadow Realm')
    within('h3.card-title') do
      assert_text 'Sign In', options={:exact => true}
    end
    within('.alert') do
      assert_text 'Sorry! Invalid email address, username or password.'
    end
    assert has_current_path?(new_user_session_path)
  end

  test 'cannot sign in with valid username and invalid password' do
    fill_in('user[login]', with: @user.username)
    fill_in('user[password]', with: "notthepassword")
    click_on('Enter the Shadow Realm')
    within('h3.card-title') do
      assert_text 'Sign In', options={:exact => true}
    end
    within('.alert') do
      assert_text 'Sorry! Invalid email address, username or password.'
    end
    assert has_current_path?(new_user_session_path)
  end
end
