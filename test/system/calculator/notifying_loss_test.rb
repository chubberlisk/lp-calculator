require 'application_system_test_case'

class NotifyingLossTest < ApplicationSystemTestCase
  # Notifying loss of player one
  test 'can reset life points when player one has lost' do
    visit calculator_url
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
    visit calculator_url
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