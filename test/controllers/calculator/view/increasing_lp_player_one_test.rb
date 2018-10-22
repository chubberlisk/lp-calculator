require 'test_helper'

class IncreasingLpPlayerOneTest < ActionDispatch::IntegrationTest
  # Increasing life points of player one
  test 'shows a button to increase life points of player one by 1000' do
    get calculator_url
    assert_select 'button#player-one-lp-plus-one-thousand[data-lp-plus="1000"]'
  end

  test 'shows a button to increase life points of player one by 500' do
    get calculator_url
    assert_select 'button#player-one-lp-plus-five-hundred[data-lp-plus="500"]'
  end

  test 'shows a button to increase life points of player one by 100' do
    get calculator_url
    assert_select 'button#player-one-lp-plus-one-hundred[data-lp-plus="100"]'
  end

  test 'shows a button to increase life points of player one by 10' do
    get calculator_url
    assert_select 'button#player-one-lp-plus-ten[data-lp-plus="10"]'
  end
end