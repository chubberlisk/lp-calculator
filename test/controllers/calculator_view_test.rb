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
    assert_select 'button#lp-minus-one-thousand[data-lp-minus]'
  end

  test 'shows a button to decrease life points of player one by 500' do
    get calculator_url
    assert_select 'button#lp-minus-five-hundred[data-lp-minus]'
  end

  test 'shows a button to decrease life points of player one by 100' do
    get calculator_url
    assert_select 'button#lp-minus-one-hundred[data-lp-minus]'
  end

  test 'shows a button to decrease life points of player one by 10' do
    get calculator_url
    assert_select 'button#lp-minus-ten[data-lp-minus]'
  end

  # Increasing life points of player one
  test 'shows a button to increase life points of player one by 1000' do
    get calculator_url
    assert_select 'button#lp-plus-one-thousand[data-lp-plus]'
  end

  test 'shows a button to increase life points of player one by 500' do
    get calculator_url
    assert_select 'button#lp-plus-five-hundred[data-lp-plus]'
  end

  test 'shows a button to increase life points of player one by 100' do
    get calculator_url
    assert_select 'button#lp-plus-one-hundred[data-lp-plus]'
  end

  test 'shows a button to increase life points of player one by 10' do
    get calculator_url
    assert_select 'button#lp-plus-ten[data-lp-plus]'
  end
end
