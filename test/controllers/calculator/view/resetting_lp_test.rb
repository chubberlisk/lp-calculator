require 'test_helper'

class ResettingLpTest < ActionDispatch::IntegrationTest
  # Resetting the life points of players
  test 'shows a button to reset life points' do
    get calculator_url
    assert_select 'button#lp-reset'
  end
end