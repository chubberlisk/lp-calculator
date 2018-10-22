require 'test_helper'

class AddingPlayerTwoTest < ActionDispatch::IntegrationTest
  # Increasing life points of player two
  test 'shows a button to increase life points of player two by 1000' do
    get calculator_url
    assert_select 'button#player-two-lp-plus-one-thousand[data-lp-plus="1000"]'
  end

  test 'shows a button to increase life points of player two by 500' do
    get calculator_url
    assert_select 'button#player-two-lp-plus-five-hundred[data-lp-plus="500"]'
  end

  test 'shows a button to increase life points of player two by 100' do
    get calculator_url
    assert_select 'button#player-two-lp-plus-one-hundred[data-lp-plus="100"]'
  end

  test 'shows a button to increase life points of player two by 10' do
    get calculator_url
    assert_select 'button#player-two-lp-plus-ten[data-lp-plus="10"]'
  end

  # Resetting the life points of players
  test 'shows a button to reset life points' do
    get calculator_url
    assert_select 'button#lp-reset'
  end
end