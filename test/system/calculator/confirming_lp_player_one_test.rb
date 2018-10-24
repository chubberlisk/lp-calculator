require 'application_system_test_case'

class ConfirmingLpPlayerOneTest < ApplicationSystemTestCase
  # Confirming change in life points of player one
  # Decreasing life points of player one
  test 'cannot see amount of life points to decrease of player one on load' do
    visit calculator_url
    assert_no_selector 'div#player-one-lp-change-section'
  end

  test 'can see 1000 life points to decrease of player one before confirming' do
    visit calculator_url
    find('button#player-one-lp-minus-one-thousand').click
    within('p#player-one-lp-change') do
      assert_text '-1000', options={:exact => true}
    end
  end

  test 'can see 1610 life points to decrease of player one before confirming' do
    visit calculator_url
    find('button#player-one-lp-minus-one-thousand').click
    find('button#player-one-lp-minus-five-hundred').click
    find('button#player-one-lp-minus-one-hundred').click
    find('button#player-one-lp-minus-ten').click
    within('p#player-one-lp-change') do
      assert_text '-1610', options={:exact => true}
    end
  end

  test 'can cancel life points to decrease of player one' do
    visit calculator_url
    find('button#player-one-lp-minus-one-thousand').click
    find('button#player-one-lp-cancel').click
    assert_no_selector 'p#player-one-lp-change'
  end

  test 'can confirm life points to decrease of player one' do
    visit calculator_url
    find('button#player-one-lp-minus-one-thousand').click
    find('button#player-one-lp-confirm').click
    within('p#player-one-lp') do
      assert_text '7000', options={:exact => true}
    end
  end

  # Increasing life points of player one
  test 'can see 1000 life points to increase of player one before confirming' do
    visit calculator_url
    find('button#player-one-show-lp-btns').click
    find('button#player-one-lp-plus-one-thousand').click
    within('p#player-one-lp-change') do
      assert_text '+1000', options={:exact => true}
    end
  end

  test 'can see 1610 life points to increase of player one before confirming' do
    visit calculator_url
    find('button#player-one-show-lp-btns').click
    find('button#player-one-lp-plus-one-thousand').click
    find('button#player-one-lp-plus-five-hundred').click
    find('button#player-one-lp-plus-one-hundred').click
    find('button#player-one-lp-plus-ten').click
    within('p#player-one-lp-change') do
      assert_text '+1610', options={:exact => true}
    end
  end

  test 'can cancel life points to increase of player one' do
    visit calculator_url
    find('button#player-one-show-lp-btns').click
    find('button#player-one-lp-plus-one-thousand').click
    find('button#player-one-lp-cancel').click
    assert_no_selector 'p#player-one-lp-change'
  end

  test 'can confirm life points to increase of player one' do
    visit calculator_url
    find('button#player-one-show-lp-btns').click
    find('button#player-one-lp-plus-one-thousand').click
    find('button#player-one-lp-confirm').click
    within('p#player-one-lp') do
      assert_text '9000', options={:exact => true}
    end
  end
end