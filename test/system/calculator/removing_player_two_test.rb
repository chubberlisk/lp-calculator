require 'application_system_test_case'

class RemovingPlayerTwoTest < ApplicationSystemTestCase
  # Removing player two
  test 'can remove player two' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#add-player-two-guest').click
    find('button#add-player-two-modal-close').click
    accept_confirm do
      find('button#remove-player-two').click
    end
    assert_no_selector 'div#player-two-section'
    assert_selector 'button#add-player-two', count: 1
  end
end
