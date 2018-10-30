require 'test_helper'

class IncreasingLpPlayerTwoTest < ActionDispatch::IntegrationTest
  # Increasing life points of player two
  def setup
    get calculator_url
  end

  test 'shows a button to increase life points of player two by 1000' do
    assert_select 'button#player-two-lp-plus-one-thousand[data-lp-plus="1000"]'
  end

  test 'shows a button to increase life points of player two by 500' do
    assert_select 'button#player-two-lp-plus-five-hundred[data-lp-plus="500"]'
  end

  test 'shows a button to increase life points of player two by 100' do
    assert_select 'button#player-two-lp-plus-one-hundred[data-lp-plus="100"]'
  end

  test 'shows a button to increase life points of player two by 10' do
    assert_select 'button#player-two-lp-plus-ten[data-lp-plus="10"]'
  end
end