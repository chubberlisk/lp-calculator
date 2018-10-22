require 'application_system_test_case'

class IncreasingLpPlayerTwoTest < ApplicationSystemTestCase
  # Increasing life points of player two
  test 'can increase the life points of player two by 1000' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-lp-plus-one-thousand').click
    within('p#player-two-lp') do
      assert_text '9000', options={:exact => true}
    end
  end

  test 'can increase the life points of player two by 500' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-lp-plus-five-hundred').click
    within('p#player-two-lp') do
      assert_text '8500', options={:exact => true}
    end
  end

  test 'can increase the life points of player two by 100' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-lp-plus-one-hundred').click
    within('p#player-two-lp') do
      assert_text '8100', options={:exact => true}
    end
  end

  test 'can increase the life points of player two by 10' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-lp-plus-ten').click
    within('p#player-two-lp') do
      assert_text '8010', options={:exact => true}
    end
  end
end