require 'system/calculator/player_one_test'

class AddingPlayerTwoTest < PlayerOneTest
  # Adding player two
  test 'can add player two' do
    assert_no_selector 'button#remove-player-two'
    find('button#add-player-two').click
    assert_selector 'div#player-two-section', count: 1
    assert_selector 'button#remove-player-two', count: 1
    assert_no_selector 'button#add-player-two'
  end
end