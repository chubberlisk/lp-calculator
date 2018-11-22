require 'application_system_test_case'

class ShowingPlayerOneUsernameTest < ApplicationSystemTestCase
  # Showing username of player one

  test 'cannot see username of player one when not signed in' do
    @user = create(:user)
    visit calculator_url
    assert_no_text 'CHANDLER'
  end

  test 'cannot see username of player one and player two when not signed in' do
    @user = create(:user)
    visit calculator_url
    assert_no_text 'CHANDLER'
    assert_no_text 'PLAYER TWO'
  end

  test 'can see username of player one when signed in' do
    @user = create(:user)
    login_as(@user)
    visit calculator_url
    within('h2#player-one') do
      assert_text 'CHANDLER'
    end
  end

  test 'can see username of player one and player two when signed in' do
    @user = create(:user)
    login_as(@user)
    visit calculator_url
    find('button#add-player-two').click
    within('h2#player-one') do
      assert_text 'CHANDLER'
    end
    within('h2#player-two') do
      assert_text 'PLAYER TWO'
    end
  end
end
