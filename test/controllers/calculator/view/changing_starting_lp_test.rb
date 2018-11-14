require 'test_helper'

class ChangingStartingLpTest < ActionDispatch::IntegrationTest
  # Changing the starting value of life points for both players
  test 'shows button to change starting life points' do
    get calculator_url
    assert_select 'button#lp-starting', 1
  end
end
