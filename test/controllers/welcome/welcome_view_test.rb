require 'test_helper'

class WelcomeViewTest < ActionDispatch::IntegrationTest
  test 'shows link to calculator' do
    get welcome_url
    assert_select 'a', 'Calculator'
  end

  test 'shows link to calculator with href to calculator page' do
    get welcome_url
    assert_select 'a[href="/calculator"]', 'Calculator'
  end
end
