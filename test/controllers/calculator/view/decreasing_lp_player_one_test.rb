require 'test_helper'

class DecreasingLpPlayerOneTest < ActionDispatch::IntegrationTest
  # Decreasing life points of player one
  def setup
    get calculator_url
  end

  test 'shows a button to decrease life points of player one by 1000' do
    assert_select 'button#player-one-lp-minus-one-thousand[data-lp-minus="1000"]'
  end

  test 'shows a button to decrease life points of player one by 500' do
    assert_select 'button#player-one-lp-minus-five-hundred[data-lp-minus="500"]'
  end

  test 'shows a button to decrease life points of player one by 100' do
    assert_select 'button#player-one-lp-minus-one-hundred[data-lp-minus="100"]'
  end

  test 'shows a button to decrease life points of player one by 10' do
    assert_select 'button#player-one-lp-minus-ten[data-lp-minus="10"]'
  end
end