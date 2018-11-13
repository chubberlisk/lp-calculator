require 'application_system_test_case'

class ShowingPlayerOneBtnsTest < ApplicationSystemTestCase
  # Showing buttons to decrease life points of player one
  def setup
    visit calculator_url
  end

  test 'can see buttons to increase life points of player one' do
    find('button#player-one-show-lp-btns').click
    assert_selector 'button#player-one-lp-plus-one-thousand', count: 1
    assert_selector 'button#player-one-lp-plus-five-hundred', count: 1
    assert_selector 'button#player-one-lp-plus-one-hundred', count: 1
    assert_selector 'button#player-one-lp-plus-ten', count: 1
    assert_selector 'button#player-one-show-lp-btns.btn.btn-primary.other', count: 1
    assert_no_selector 'button#player-one-lp-minus-one-thousand'
    assert_no_selector 'button#player-one-lp-minus-five-hundred'
    assert_no_selector 'button#player-one-lp-minus-one-hundred'
    assert_no_selector 'button#player-one-lp-minus-ten'
    assert_no_selector 'button#player-one-lp-plus-divide-two'
  end

  test 'can see other buttons to change life points of player one' do
    find('button#player-one-show-lp-btns').click
    find('button#player-one-show-lp-btns').click
    assert_selector 'button#player-one-lp-divide-two', count: 1
    assert_selector 'button#player-one-show-lp-btns.btn.btn-primary.minus', count: 1
    assert_no_selector 'button#player-one-lp-plus-one-thousand'
    assert_no_selector 'button#player-one-lp-plus-five-hundred'
    assert_no_selector 'button#player-one-lp-plus-one-hundred'
    assert_no_selector 'button#player-one-lp-plus-ten'
  end

  test 'can see buttons to decrease life points of player one' do
    find('button#player-one-show-lp-btns').click
    find('button#player-one-show-lp-btns').click
    find('button#player-one-show-lp-btns').click
    assert_selector 'button#player-one-lp-minus-one-thousand', count: 1
    assert_selector 'button#player-one-lp-minus-five-hundred', count: 1
    assert_selector 'button#player-one-lp-minus-one-hundred', count: 1
    assert_selector 'button#player-one-lp-minus-ten', count: 1
    assert_selector 'button#player-one-show-lp-btns.btn.btn-primary.plus', count: 1
    assert_no_selector 'button#player-one-lp-plus-divide-two'
  end
end
