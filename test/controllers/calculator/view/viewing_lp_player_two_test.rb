require 'controllers/calculator/calculator_test'

class ViewingLpPlayerTwoTest < CalculatorTest
  # Viewing life points of player two
  test 'shows the current life points of player two' do
    assert_select 'h2#player-two', 1
    assert_select 'p#player-two-lp', 1
  end

  test 'the life points of player two is a number and not empty' do
    assert_select 'p#player-two-lp', /\A[+-]?\d+?(_?\d+)*(\.\d+e?\d*)?\Z/, 1
  end

  test 'the life points of player two begins with 8000' do
    assert_select 'p#player-two-lp', '8000', 1
  end
end