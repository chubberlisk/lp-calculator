require 'test_helper'

class IncreasingLpPlayerOneTest < ActionDispatch::IntegrationTest
  # Increasing life points of player one
  def setup
    get calculator_url
  end

  test 'shows a button to increase life points of player one by 1000' do
    assert_select 'button#player-one-lp-plus-one-thousand[data-lp-plus="1000"]'
  end

  test 'shows a button to increase life points of player one by 500' do
    assert_select 'button#player-one-lp-plus-five-hundred[data-lp-plus="500"]'
  end

  test 'shows a button to increase life points of player one by 100' do
    assert_select 'button#player-one-lp-plus-one-hundred[data-lp-plus="100"]'
  end

  test 'shows a button to increase life points of player one by 10' do
    assert_select 'button#player-one-lp-plus-ten[data-lp-plus="10"]'
  end
end