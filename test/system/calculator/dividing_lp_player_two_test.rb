require 'application_system_test_case'

class DividingLpPlayerTwoTest < ApplicationSystemTestCase
  # Dividing by 2 life points of player two
  test 'can divide by 2 life points of player two' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-show-lp-btns').click
    find('button#player-two-show-lp-btns').click
    find('button#player-two-lp-divide-two').click
    find('button#player-two-lp-confirm').click
    within('p#player-two-lp') do
      assert_text '4000', options={:exact => true}
    end
  end
end
