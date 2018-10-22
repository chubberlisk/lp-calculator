require 'test_helper'

class DecreasingLpPlayerOneTest < ActionDispatch::IntegrationTest
  # Decreasing life points of player one
  test 'shows a button to decrease life points of player one by 1000' do
    get calculator_url
    assert_select 'button#player-one-lp-minus-one-thousand[data-lp-minus="1000"]'
  end

  test 'shows a button to decrease life points of player one by 500' do
    get calculator_url
    assert_select 'button#player-one-lp-minus-five-hundred[data-lp-minus="500"]'
  end

  test 'shows a button to decrease life points of player one by 100' do
    get calculator_url
    assert_select 'button#player-one-lp-minus-one-hundred[data-lp-minus="100"]'
  end

  test 'shows a button to decrease life points of player one by 10' do
    get calculator_url
    assert_select 'button#player-one-lp-minus-ten[data-lp-minus="10"]'
  end
end