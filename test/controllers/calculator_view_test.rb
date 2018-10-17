require 'test_helper'

class CalculatorViewTest < ActionDispatch::IntegrationTest
  test 'shows the current life points of player one' do
    get calculator_url
    assert_select 'p#player-one-lp'
  end

  test 'the life points of player one is not empty' do
    get calculator_url
    assert_select 'p#player-one-lp', /\A[+-]?\d+?(_?\d+)*(\.\d+e?\d*)?\Z/
  end

  test 'the life points of player one begins with 8000' do
    get calculator_url
    assert_select 'p#player-one-lp', '8000'
  end

  test 'shows a button to decrease life points of player one by 1000' do
    get calculator_url
    assert_select 'button#lp-minus-one-thousand'
  end

  test 'shows a button to decrease life points of player one by 500' do
    get calculator_url
    assert_select 'button#lp-minus-five-hundred'
  end

  test 'shows a button to decrease life points of player one by 100' do
    get calculator_url
    assert_select 'button#lp-minus-one-hundred'
  end

  test 'shows a button to decrease life points of player one by 10' do
    get calculator_url
    assert_select 'button#lp-minus-ten'
  end
end
