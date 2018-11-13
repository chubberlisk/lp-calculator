require 'test_helper'

class RotatingLpTest < ActionDispatch::IntegrationTest
  # Rotating the viewing life points of players
  test 'shows a button to rotate viewing of life points' do
    get calculator_url
    assert_select 'button#lp-rotate'
  end
end
