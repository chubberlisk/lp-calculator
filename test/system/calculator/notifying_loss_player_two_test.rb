require 'system/calculator/player_two_test'

class NotifyingLossPlayerTwoTest < PlayerTwoTest
  # Notifying loss of player two
  test 'can reset life points when player two has lost' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-lp-minus-five-hundred').click
    find('button#player-two-lp-confirm').click
    for i in 0..7 do
      find('button#player-two-lp-minus-one-thousand').click
    end
    accept_confirm do
      find('button#player-two-lp-confirm').click
    end
    within('p#player-two-lp') do
      assert_text '8000', options={:exact => true}
    end
  end

  test 'can see life points when player two has lost' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-lp-minus-five-hundred').click
    find('button#player-two-lp-confirm').click
    for i in 0..7 do
      find('button#player-two-lp-minus-one-thousand').click
    end
    dismiss_confirm do
      find('button#player-two-lp-confirm').click
    end
    within('p#player-two-lp') do
      assert_text '0', options={:exact => true}
    end
  end
end