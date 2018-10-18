require 'test_helper'

class CalculatorViewTest < ActionDispatch::IntegrationTest
  # Viewing life points of player one
  test 'shows the current life points of player one' do
    get calculator_url
    assert_select 'p#player-one-lp', 1
  end

  test 'the life points of player one is a number and not empty' do
    get calculator_url
    assert_select 'p#player-one-lp', /\A[+-]?\d+?(_?\d+)*(\.\d+e?\d*)?\Z/, 1
  end

  # Decreasing life points of player one
  test 'the life points of player one begins with 8000' do
    get calculator_url
    assert_select 'p#player-one-lp', '8000', 1
  end

  test 'shows a button to decrease life points of player one by 1000' do
    get calculator_url
    assert_select 'button#lp-minus-one-thousand[data-lp-minus="1000"]'
  end

  test 'shows a button to decrease life points of player one by 500' do
    get calculator_url
    assert_select 'button#lp-minus-five-hundred[data-lp-minus="500"]'
  end

  test 'shows a button to decrease life points of player one by 100' do
    get calculator_url
    assert_select 'button#lp-minus-one-hundred[data-lp-minus="100"]'
  end

  test 'shows a button to decrease life points of player one by 10' do
    get calculator_url
    assert_select 'button#lp-minus-ten[data-lp-minus="10"]'
  end

  # Resetting the life points of player one
  test 'shows a button to reset life points of player one' do
    get calculator_url
    assert_select 'button#lp-reset'
  end

  # Increasing life points of player one
  test 'shows a button to increase life points of player one by 1000' do
    get calculator_url
    assert_select 'button#lp-plus-one-thousand[data-lp-plus="1000"]'
  end

  test 'shows a button to increase life points of player one by 500' do
    get calculator_url
    assert_select 'button#lp-plus-five-hundred[data-lp-plus="500"]'
  end

  test 'shows a button to increase life points of player one by 100' do
    get calculator_url
    assert_select 'button#lp-plus-one-hundred[data-lp-plus="100"]'
  end

  test 'shows a button to increase life points of player one by 10' do
    get calculator_url
    assert_select 'button#lp-plus-ten[data-lp-plus="10"]'
  end
end
