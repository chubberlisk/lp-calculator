require 'application_system_test_case'

class AddingPlayerTwoTest < ApplicationSystemTestCase
  # Adding player two
  def setup
    @chandler = create(:chandler)
    @monica = create(:monica)
  end

  test 'can add player two as a guest when not signed in' do
    visit calculator_url
    assert_no_selector 'button#remove-player-two'
    find('button#add-player-two').click
    assert_no_selector 'button#add-player-two-account'
    find('button#add-player-two-guest').click
    # force modal close
    find('button#add-player-two-modal-close').click
    assert_selector 'div#player-two-section', count: 1
    assert_selector 'button#remove-player-two', count: 1
    assert_no_selector 'button#add-player-two'
    assert_no_selector '#add-player-two-modal'
  end

  test 'can add player two as a guest when signed in' do
    login_as(@chandler)
    visit calculator_url
    assert_no_selector 'button#remove-player-two'
    find('button#add-player-two').click
    find('button#add-player-two-guest').click
    # force modal close
    find('button#add-player-two-modal-close').click
    within('h2#player-one') do
      assert_text @chandler.username.upcase, options={:exact => true}
    end
    within('h2#player-two') do
      assert_text 'PLAYER TWO', options={:exact => true}
    end
    assert_selector 'div#player-two-section', count: 1
    assert_selector 'button#remove-player-two', count: 1
    assert_no_selector 'button#add-player-two'
    assert_no_selector '#add-player-two-modal'
  end

  test 'can view form to add player two with account when signed in' do
    login_as(@chandler)
    visit calculator_url
    assert_no_selector 'button#remove-player-two'
    find('button#add-player-two').click
    find('button#add-player-two-account').click
    assert_selector 'input#player-two-email', count: 1
    assert_selector 'input#player-two-password', count: 1
  end

  test 'can add player two with an account when signed in' do
    login_as(@chandler)
    visit calculator_url
    assert_no_selector 'button#remove-player-two'
    find('button#add-player-two').click
    find('button#add-player-two-account').click
    fill_in('player_two[email]', with: @monica.email)
    fill_in('player_two[password]', with: @monica.password)
    click_on('Add')
    within('h2#player-one') do
      assert_text @chandler.username.upcase, options={:exact => true}
    end
    within('h2#player-two') do
      assert_text @monica.username.upcase, options={:exact => true}
    end
    assert_selector 'div#player-two-section', count: 1
    assert_selector 'button#remove-player-two', count: 1
    assert_no_selector 'button#add-player-two'
    assert_no_selector '#add-player-two-modal'
  end

  test 'cannot add player two with an account if empty email and password when signed in' do
    login_as(@chandler)
    visit calculator_url
    assert_no_selector 'button#remove-player-two'
    find('button#add-player-two').click
    find('button#add-player-two-account').click
    fill_in('player_two[email]', with: "")
    fill_in('player_two[password]', with: "")
    click_on('Add')
    assert_text "Sorry! Invalid email or password."
  end

  test 'cannot add player two with an account if valid email and empty password when signed in' do
    login_as(@chandler)
    visit calculator_url
    assert_no_selector 'button#remove-player-two'
    find('button#add-player-two').click
    find('button#add-player-two-account').click
    fill_in('player_two[email]', with: @monica.email)
    fill_in('player_two[password]', with: "")
    click_on('Add')
    assert_text "Sorry! Invalid email or password."
  end

  test 'cannot add player two with an account if valid email and invalid password when signed in' do
    login_as(@chandler)
    visit calculator_url
    assert_no_selector 'button#remove-player-two'
    find('button#add-player-two').click
    find('button#add-player-two-account').click
    fill_in('player_two[email]', with: @monica.email)
    fill_in('player_two[password]', with: "notpassword")
    click_on('Add')
    assert_text "Sorry! Invalid email or password."
  end

  test 'cannot add player two with an current user account when signed in' do
    login_as(@chandler)
    visit calculator_url
    assert_no_selector 'button#remove-player-two'
    find('button#add-player-two').click
    find('button#add-player-two-account').click
    fill_in('player_two[email]', with: @chandler.email)
    fill_in('player_two[password]', with: @chandler.password)
    click_on('Add')
    assert_text "Sorry! Invalid email or password."
  end
end
