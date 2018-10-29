require 'test_helper'

class CalculatorTest < ActionDispatch::IntegrationTest
  def setup
    get calculator_url
  end
end