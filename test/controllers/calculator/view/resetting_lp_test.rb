require 'controllers/calculator/calculator_test'

class ResettingLpTest < CalculatorTest
  # Resetting the life points of players
  test 'shows a button to reset life points' do
    assert_select 'button#lp-reset'
  end
end