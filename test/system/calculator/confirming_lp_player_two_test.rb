require 'system/calculator/player_two_test'

class ConfirmingLpPlayerTwoTest < PlayerTwoTest
  # Confirming change in life points of player two
  # Decreasing life points of player two
  test 'cannot see amount of life points to decrease of player two on load' do
    assert_no_selector 'div#player-two-lp-change-section'
  end

  test 'can see 1000 life points to decrease of player two before confirming' do
    find('button#player-two-lp-minus-one-thousand').click
    within('p#player-two-lp-change') do
      assert_text '-1000', options={:exact => true}
    end
  end

  test 'can see 1610 life points to decrease of player two before confirming' do
    find('button#player-two-lp-minus-one-thousand').click
    find('button#player-two-lp-minus-five-hundred').click
    find('button#player-two-lp-minus-one-hundred').click
    find('button#player-two-lp-minus-ten').click
    within('p#player-two-lp-change') do
      assert_text '-1610', options={:exact => true}
    end
  end

  test 'stops value to decrease if equal to current life points of player two' do
    for i in 0..8 do
      find('button#player-two-lp-minus-one-thousand').click
    end
    within('p#player-two-lp-change') do
      assert_text '-8000', options={:exact => true}
    end
  end

  test 'can cancel life points to decrease of player two' do
    find('button#player-two-lp-minus-one-thousand').click
    find('button#player-two-lp-cancel').click
    assert_no_selector 'p#player-two-lp-change'
  end

  test 'can confirm life points to decrease of player two' do
    find('button#player-two-lp-minus-one-thousand').click
    find('button#player-two-lp-confirm').click
    within('p#player-two-lp') do
      assert_text '7000', options={:exact => true}
    end
  end

  # Increasing life points of player one
  test 'can see 1000 life points to increase of player two before confirming' do
    find('button#player-two-show-lp-btns').click
    find('button#player-two-lp-plus-one-thousand').click
    within('p#player-two-lp-change') do
      assert_text '+1000', options={:exact => true}
    end
  end

  test 'can see 1610 life points to increase of player two before confirming' do
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
    find('button#player-two-show-lp-btns').click
    find('button#player-two-lp-plus-one-thousand').click
    find('button#player-two-lp-cancel').click
    assert_no_selector 'p#player-two-lp-change'
  end

  test 'can confirm life points to increase of player two' do
    find('button#player-two-show-lp-btns').click
    find('button#player-two-lp-plus-one-thousand').click
    find('button#player-two-lp-confirm').click
    within('p#player-two-lp') do
      assert_text '9000', options={:exact => true}
    end
  end
end