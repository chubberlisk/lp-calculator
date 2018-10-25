require 'test_helper'

class ViewingLpPlayerOneTest < ActionDispatch::IntegrationTest
  # Viewing life points of player one
  test 'shows the current life points of player one' do
    get calculator_url
    assert_select 'h2#player-one', 1
    assert_select 'p#player-one-lp', 1
  end

  test 'the life points of player one is a number and not empty' do
    get calculator_url
    assert_select 'p#player-one-lp', /\A[+-]?\d+?(_?\d+)*(\.\d+e?\d*)?\Z/, 1
  end

  test 'the life points of player one begins with 8000' do
    get calculator_url
    assert_select 'p#player-one-lp', '8000', 1
  end
end