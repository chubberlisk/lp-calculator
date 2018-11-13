require 'application_system_test_case'

class DoublingLpPlayerOneTest < ApplicationSystemTestCase
  # Doubling life points of player one
  test 'can double life points of player one' do
    visit calculator_url
    find('button#player-one-show-lp-btns').click
    find('button#player-one-show-lp-btns').click
    find('button#player-one-lp-double').click
    find('button#player-one-lp-confirm').click
    within('p#player-one-lp') do
      assert_text '16000', options={:exact => true}
    end
  end
end
