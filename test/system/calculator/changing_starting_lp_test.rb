require 'application_system_test_case'

class ChangingStartingLpTest < ApplicationSystemTestCase
  # Changing the starting value of life points for both players
  test 'can change starting life points to 4000' do
    visit calculator_url
    find('button#lp-starting').click
    find('input#lp-starting-radio-four-thousand').choose
    find('button#lp-starting-modal-close').click
    accept_confirm do
      find('button#lp-reset').click
    end
    within('p#player-one-lp') do
      assert_text '4000', options={:exact => true}
    end
  end
end
