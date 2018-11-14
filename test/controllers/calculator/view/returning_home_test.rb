require 'test_helper'

class ReturningHomeTest < ActionDispatch::IntegrationTest
  # Returning to LP Calculator home page
  test 'shows button to return to home page' do
    get calculator_url
    assert_select 'a[href="/"]', 1
  end
end
