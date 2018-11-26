require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = create(:user)
    @other_user = create(:user, email: 'monica@friends.com', username: 'monica')
  end

  test 'should get user profile if current user is viewing their own profile and they are signed in' do
    login_as(@user)
    get user_profile_path(@user)
    assert_response :success
  end

  test 'should not get user profile if user not signed in' do
    get user_profile_path(@user)
    assert_redirected_to new_user_session_path
  end

  test 'should not get user profile if user signed in and not viewing own user profile' do
    login_as(@user)
    get user_profile_path(@other_user)
    assert_response :unauthorized
  end
end
