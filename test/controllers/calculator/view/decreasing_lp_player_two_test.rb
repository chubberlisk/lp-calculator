require 'test_helper'

class DecreasingLpPlayerTwoTest < ActionDispatch::IntegrationTest
  # Decreasing life points of player two
  test 'shows a button to decrease life points of player two by 1000' do
    get calculator_url
    assert_select 'button#player-two-lp-minus-one-thousand[data-lp-minus="1000"]'
  end

  test 'shows a button to decrease life points of player two by 500' do
    get calculator_url
    assert_select 'button#player-two-lp-minus-five-hundred[data-lp-minus="500"]'
  end

  test 'shows a button to decrease life points of player two by 100' do
    get calculator_url
    assert_select 'button#player-two-lp-minus-one-hundred[data-lp-minus="100"]'
  end

  test 'shows a button to decrease life points of player two by 10' do
    get calculator_url
    assert_select 'button#player-two-lp-minus-ten[data-lp-minus="10"]'
  end
end