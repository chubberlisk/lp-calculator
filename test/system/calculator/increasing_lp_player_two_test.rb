require 'system/calculator/player_two_test'

class IncreasingLpPlayerTwoTest < PlayerTwoTest
  # Increasing life points of player two
  test 'can increase the life points of player two by 1000' do
    find('button#player-two-show-lp-btns').click
    find('button#player-two-lp-plus-one-thousand').click
    find('button#player-two-lp-confirm').click
    within('p#player-two-lp') do
      assert_text '9000', options={:exact => true}
    end
  end

  test 'can increase the life points of player two by 500' do
    find('button#player-two-show-lp-btns').click
    find('button#player-two-lp-plus-five-hundred').click
    find('button#player-two-lp-confirm').click
    within('p#player-two-lp') do
      assert_text '8500', options={:exact => true}
    end
  end

  test 'can increase the life points of player two by 100' do
    find('button#player-two-show-lp-btns').click
    find('button#player-two-lp-plus-one-hundred').click
    find('button#player-two-lp-confirm').click
    within('p#player-two-lp') do
      assert_text '8100', options={:exact => true}
    end
  end

  test 'can increase the life points of player two by 10' do
    find('button#player-two-show-lp-btns').click
    find('button#player-two-lp-plus-ten').click
    find('button#player-two-lp-confirm').click
    within('p#player-two-lp') do
      assert_text '8010', options={:exact => true}
    end
  end
end