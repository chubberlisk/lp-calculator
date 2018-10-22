require 'test_helper'

class ViewingLpPlayerTwoTest < ActionDispatch::IntegrationTest
  # Viewing life points of player two
  test 'shows the current life points of player two' do
    get calculator_url
    assert_select 'p#player-two-lp', 1
  end

  test 'the life points of player two is a number and not empty' do
    get calculator_url
    assert_select 'p#player-two-lp', /\A[+-]?\d+?(_?\d+)*(\.\d+e?\d*)?\Z/, 1
  end

  test 'the life points of player two begins with 8000' do
    get calculator_url
    assert_select 'p#player-two-lp', '8000', 1
  end
end