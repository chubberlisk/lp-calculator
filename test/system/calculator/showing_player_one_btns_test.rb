require 'application_system_test_case'

class ShowingPlayerOneBtnsTest < ApplicationSystemTestCase
  # Showing buttons to decrease life points of player one
  test 'can see buttons to increase life points of player one' do
    visit calculator_url
    find('button#player-one-show-lp-btns').click
    assert_selector 'button#player-one-lp-plus-one-thousand', count: 1
    assert_selector 'button#player-one-lp-plus-five-hundred', count: 1
    assert_selector 'button#player-one-lp-plus-one-hundred', count: 1
    assert_selector 'button#player-one-lp-plus-ten', count: 1
    assert_no_selector 'button#player-one-lp-minus-one-thousand'
    assert_no_selector 'button#player-one-lp-minus-five-hundred'
    assert_no_selector 'button#player-one-lp-minus-one-hundred'
    assert_no_selector 'button#player-one-lp-minus-ten'
    within('button#player-one-show-lp-btns.minus') do
      assert_text '-', options={:exact => true}
    end
  end

  test 'can see buttons to decrease life points of player one' do
    visit calculator_url
    find('button#player-one-show-lp-btns').click
    find('button#player-one-show-lp-btns').click
    assert_selector 'button#player-one-lp-minus-one-thousand', count: 1
    assert_selector 'button#player-one-lp-minus-five-hundred', count: 1
    assert_selector 'button#player-one-lp-minus-one-hundred', count: 1
    assert_selector 'button#player-one-lp-minus-ten', count: 1
    assert_no_selector 'button#player-one-lp-plus-one-thousand'
    assert_no_selector 'button#player-one-lp-plus-five-hundred'
    assert_no_selector 'button#player-one-lp-plus-one-hundred'
    assert_no_selector 'button#player-one-lp-plus-ten'
    within('button#player-one-show-lp-btns') do
      assert_text '+', options={:exact => true}
    end
  end
end