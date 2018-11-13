require 'application_system_test_case'

class DividingLpPlayerOneTest < ApplicationSystemTestCase
  # Dividing by 2 life points of player one
  test 'can divide by 2 life points of player one' do
    visit calculator_url
    find('button#player-one-show-lp-btns').click
    find('button#player-one-show-lp-btns').click
    find('button#player-one-lp-divide-two').click
    find('button#player-one-lp-confirm').click
    within('p#player-one-lp') do
      assert_text '4000', options={:exact => true}
    end
  end
end
