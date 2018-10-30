require 'application_system_test_case'

class NotifyingLossPlayerOneTest < ApplicationSystemTestCase
  # Notifying loss of player one
  def setup
    visit calculator_url
    find('button#player-one-lp-minus-five-hundred').click
    find('button#player-one-lp-confirm').click
    for i in 0..7 do
      find('button#player-one-lp-minus-one-thousand').click
    end
  end

  test 'can reset life points when player one has lost' do
    accept_confirm do
      find('button#player-one-lp-confirm').click
    end
    within('p#player-one-lp') do
      assert_text '8000', options={:exact => true}
    end
  end

  test 'can see life points when player one has lost' do
    dismiss_confirm do
      find('button#player-one-lp-confirm').click
    end
    within('p#player-one-lp') do
      assert_text '0', options={:exact => true}
    end
  end
end