require 'controllers/calculator/calculator_test'

class IncreasingLpPlayerTwoTest < CalculatorTest
  # Increasing life points of player two
  test 'shows a button to increase life points of player two by 1000' do
    assert_select 'button#player-two-lp-plus-one-thousand[data-lp-plus="1000"]'
  end

  test 'shows a button to increase life points of player two by 500' do
    assert_select 'button#player-two-lp-plus-five-hundred[data-lp-plus="500"]'
  end

  test 'shows a button to increase life points of player two by 100' do
    assert_select 'button#player-two-lp-plus-one-hundred[data-lp-plus="100"]'
  end

  test 'shows a button to increase life points of player two by 10' do
    assert_select 'button#player-two-lp-plus-ten[data-lp-plus="10"]'
  end
end