require 'test_helper'

class AddingPlayerTwoTest < ActionDispatch::IntegrationTest
  # Adding player two
  test 'shows button to add another player' do
    get calculator_url
    assert_select 'button#add-player-two', 1
  end
end