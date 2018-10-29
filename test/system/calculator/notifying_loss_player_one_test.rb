require 'system/calculator/player_one_test'

class NotifyingLossPlayerOneTest < PlayerOneTest
  # Notifying loss of player one
  test 'can reset life points when player one has lost' do
    find('button#player-one-lp-minus-five-hundred').click
    find('button#player-one-lp-confirm').click
    for i in 0..7 do
      find('button#player-one-lp-minus-one-thousand').click
    end
    accept_confirm do
      find('button#player-one-lp-confirm').click
    end
    within('p#player-one-lp') do
      assert_text '8000', options={:exact => true}
    end
  end

  test 'can see life points when player one has lost' do
    find('button#player-one-lp-minus-five-hundred').click
    find('button#player-one-lp-confirm').click
    for i in 0..7 do
      find('button#player-one-lp-minus-one-thousand').click
    end
    dismiss_confirm do
      find('button#player-one-lp-confirm').click
    end
    within('p#player-one-lp') do
      assert_text '0', options={:exact => true}
    end
  end
end