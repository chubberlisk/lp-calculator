require 'test_helper'

class CalculatorControllerTest < ActionDispatch::IntegrationTest
  test 'should get index if calculator_url named helper used' do
    get calculator_url
    assert_response :success
  end
end
