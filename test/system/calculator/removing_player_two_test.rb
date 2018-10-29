require 'system/calculator/player_two_test'

class RemovingPlayerTwoTest < PlayerTwoTest
  # Removing player two
  test 'can remove player two' do
    accept_confirm do
      find('button#remove-player-two').click
    end
    assert_no_selector 'div#player-two-section'
    assert_selector 'button#add-player-two', count: 1
  end
end
