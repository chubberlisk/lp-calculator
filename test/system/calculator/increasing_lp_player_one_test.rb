require 'application_system_test_case'

class IncreasingLpPlayerOneTest < ApplicationSystemTestCase
  # Increasing life points of player one
  test 'can increase life points of player one by 1000' do
    visit calculator_url
    find('button#player-one-lp-plus-one-thousand').click
    within('p#player-one-lp') do
      assert_text '9000', options={:exact => true}
    end
  end

  test 'can increase life points of player one by 500' do
    visit calculator_url
    find('button#player-one-lp-plus-five-hundred').click
    within('p#player-one-lp') do
      assert_text '8500', options={:exact => true}
    end
  end

  test 'can increase life points of player one by 100' do
    visit calculator_url
    find('button#player-one-lp-plus-one-hundred').click
    within('p#player-one-lp') do
      assert_text '8100', options={:exact => true}
    end
  end

  test 'can increase life points of player one by 10' do
    visit calculator_url
    find('button#player-one-lp-plus-ten').click
    within('p#player-one-lp') do
      assert_text '8010', options={:exact => true}
    end
  end
end