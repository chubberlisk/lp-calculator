require 'controllers/calculator/calculator_test'

class AddingPlayerTwoTest < CalculatorTest
  # Adding player two
  test 'shows button to add another player' do
    assert_select 'button#add-player-two', 1
  end
end