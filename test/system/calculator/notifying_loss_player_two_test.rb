require 'application_system_test_case'

class NotifyingLossPlayerTwoTest < ApplicationSystemTestCase
  # Notifying loss of player two
  def setup
    visit calculator_url
    find('button#add-player-two').click
    find('button#add-player-two-guest').click
    find('button#add-player-two-modal-close').click
    find('button#player-two-lp-minus-five-hundred').click
    find('button#player-two-lp-confirm').click
    for i in 0..7 do
      find('button#player-two-lp-minus-one-thousand').click
    end
  end

  test 'can reset life points when player two has lost' do
    accept_confirm do
      find('button#player-two-lp-confirm').click
    end
    within('p#player-two-lp') do
      assert_text '8000', options={:exact => true}
    end
  end

  test 'can see life points when player two has lost' do
    dismiss_confirm do
      find('button#player-two-lp-confirm').click
    end
    within('p#player-two-lp') do
      assert_text '0', options={:exact => true}
    end
  end
end
