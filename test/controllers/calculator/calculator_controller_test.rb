require 'controllers/calculator/calculator_test'

class CalculatorControllerTest < CalculatorTest
  test 'should get index if calculator_url named helper used' do
    assert_response :success
  end
end
