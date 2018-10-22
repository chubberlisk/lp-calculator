require 'application_system_test_case'

class DecreasingLpPlayerTwoTest < ApplicationSystemTestCase
  # Decreasing life points of player two
  test 'can reduce the life points of player two by 1000' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-lp-minus-one-thousand').click
    within('p#player-two-lp') do
      assert_text '7000', options={:exact => true}
    end
  end

  test 'can reduce the life points of player two by 500' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-lp-minus-five-hundred').click
    within('p#player-two-lp') do
      assert_text '7500', options={:exact => true}
    end
  end

  test 'can reduce the life points of player two by 100' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-lp-minus-one-hundred').click
    within('p#player-two-lp') do
      assert_text '7900', options={:exact => true}
    end
  end

  test 'can reduce the life points of player two by 10' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-lp-minus-ten').click
    within('p#player-two-lp') do
      assert_text '7990', options={:exact => true}
    end
  end
end