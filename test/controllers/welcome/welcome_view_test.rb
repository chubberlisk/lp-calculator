require 'test_helper'

class WelcomeViewTest < ActionDispatch::IntegrationTest
  def setup
    get welcome_url
  end

  test 'shows link to calculator' do
    assert_select 'a'
  end

  test 'shows link to calculator with href to calculator page' do
    assert_select 'a[href="/calculator"]'
  end
end
