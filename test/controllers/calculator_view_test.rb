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

  test 'the life points of player one begins with 8000' do
    get calculator_url
    assert_select 'p#player-one-lp', '8000', 1
  end

  # Decreasing life points of player one
  test 'shows a button to decrease life points of player one by 1000' do
    get calculator_url
    assert_select 'button#player-one-lp-minus-one-thousand[data-lp-minus="1000"]'
  end

  test 'shows a button to decrease life points of player one by 500' do
    get calculator_url
    assert_select 'button#player-one-lp-minus-five-hundred[data-lp-minus="500"]'
  end

  test 'shows a button to decrease life points of player one by 100' do
    get calculator_url
    assert_select 'button#player-one-lp-minus-one-hundred[data-lp-minus="100"]'
  end

  test 'shows a button to decrease life points of player one by 10' do
    get calculator_url
    assert_select 'button#player-one-lp-minus-ten[data-lp-minus="10"]'
  end

  # Increasing life points of player one
  test 'shows a button to increase life points of player one by 1000' do
    get calculator_url
    assert_select 'button#player-one-lp-plus-one-thousand[data-lp-plus="1000"]'
  end

  test 'shows a button to increase life points of player one by 500' do
    get calculator_url
    assert_select 'button#player-one-lp-plus-five-hundred[data-lp-plus="500"]'
  end

  test 'shows a button to increase life points of player one by 100' do
    get calculator_url
    assert_select 'button#player-one-lp-plus-one-hundred[data-lp-plus="100"]'
  end

  test 'shows a button to increase life points of player one by 10' do
    get calculator_url
    assert_select 'button#player-one-lp-plus-ten[data-lp-plus="10"]'
  end

  # Adding player two
  test 'shows button to add another player' do
    get calculator_url
    assert_select 'button#add-player-two', 1
  end

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
