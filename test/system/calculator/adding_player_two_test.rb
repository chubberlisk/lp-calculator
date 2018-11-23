require 'application_system_test_case'

class AddingPlayerTwoTest < ApplicationSystemTestCase
  # Adding player two
  test 'can add player two as a guest' do
    visit calculator_url
    assert_no_selector 'button#remove-player-two'
    find('button#add-player-two').click
    find('button#add-player-two-guest').click
    # force modal close
    find('button#add-player-two-modal-close').click
    assert_selector 'div#player-two-section', count: 1
    assert_selector 'button#remove-player-two', count: 1
    assert_no_selector 'button#add-player-two'
    assert_no_selector '#add-player-two-modal'
  end

  test 'can view form to add player two with account' do
    visit calculator_url
    assert_no_selector 'button#remove-player-two'
    find('button#add-player-two').click
    find('button#add-player-two-account').click
    assert_selector 'input#player-two-email', count: 1
    assert_selector 'input#player-two-password', count: 1
  end
end
