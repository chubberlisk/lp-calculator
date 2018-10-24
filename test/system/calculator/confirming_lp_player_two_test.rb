require 'application_system_test_case'

class ConfirmingLpPlayerTwoTest < ApplicationSystemTestCase
  # Confirming change in life points of player two
  # Decreasing life points of player two
  test 'cannot see amount of life points to decrease of player two on load' do
    visit calculator_url
    find('button#add-player-two').click
    assert_no_selector 'div#player-two-lp-change-section'
  end

  test 'can see 1000 life points to decrease of player two before confirming' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-lp-minus-one-thousand').click
    within('p#player-two-lp-change') do
      assert_text '-1000', options={:exact => true}
    end
  end

  test 'can see 1610 life points to decrease of player two before confirming' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-lp-minus-one-thousand').click
    find('button#player-two-lp-minus-five-hundred').click
    find('button#player-two-lp-minus-one-hundred').click
    find('button#player-two-lp-minus-ten').click
    within('p#player-two-lp-change') do
      assert_text '-1610', options={:exact => true}
    end
  end

  test 'can cancel life points to decrease of player two' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-lp-minus-one-thousand').click
    find('button#player-two-lp-cancel').click
    assert_no_selector 'p#player-two-lp-change'
  end

  test 'can confirm life points to decrease of player two' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-lp-minus-one-thousand').click
    find('button#player-two-lp-confirm').click
    within('p#player-two-lp') do
      assert_text '7000', options={:exact => true}
    end
  end

  # Increasing life points of player one
  test 'can see 1000 life points to increase of player two before confirming' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-show-lp-btns').click
    find('button#player-two-lp-plus-one-thousand').click
    within('p#player-two-lp-change') do
      assert_text '+1000', options={:exact => true}
    end
  end

  test 'can see 1610 life points to increase of player two before confirming' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-show-lp-btns').click
    find('button#player-two-lp-plus-one-thousand').click
    find('button#player-two-lp-plus-five-hundred').click
    find('button#player-two-lp-plus-one-hundred').click
    find('button#player-two-lp-plus-ten').click
    within('p#player-two-lp-change') do
      assert_text '+1610', options={:exact => true}
    end
  end

  test 'can cancel life points to increase of player two' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-show-lp-btns').click
    find('button#player-two-lp-plus-one-thousand').click
    find('button#player-two-lp-cancel').click
    assert_no_selector 'p#player-two-lp-change'
  end

  test 'can confirm life points to increase of player two' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-show-lp-btns').click
    find('button#player-two-lp-plus-one-thousand').click
    find('button#player-two-lp-confirm').click
    within('p#player-two-lp') do
      assert_text '9000', options={:exact => true}
    end
  end
end