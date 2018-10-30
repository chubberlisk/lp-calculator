require 'application_system_test_case'

class IncreasingLpPlayerOneTest < ApplicationSystemTestCase
  # Increasing life points of player one
  def setup
    visit calculator_url
    find('button#player-one-show-lp-btns').click
  end

  test 'can increase life points of player one by 1000' do
    find('button#player-one-lp-plus-one-thousand').click
    find('button#player-one-lp-confirm').click
    within('p#player-one-lp') do
      assert_text '9000', options={:exact => true}
    end
  end

  test 'can increase life points of player one by 500' do
    find('button#player-one-lp-plus-five-hundred').click
    find('button#player-one-lp-confirm').click
    within('p#player-one-lp') do
      assert_text '8500', options={:exact => true}
    end
  end

  test 'can increase life points of player one by 100' do
    find('button#player-one-lp-plus-one-hundred').click
    find('button#player-one-lp-confirm').click
    within('p#player-one-lp') do
      assert_text '8100', options={:exact => true}
    end
  end

  test 'can increase life points of player one by 10' do
    find('button#player-one-lp-plus-ten').click
    find('button#player-one-lp-confirm').click
    within('p#player-one-lp') do
      assert_text '8010', options={:exact => true}
    end
  end
end