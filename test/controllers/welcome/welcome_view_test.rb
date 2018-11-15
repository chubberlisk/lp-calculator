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

  test 'shows a sign up button' do
    assert_select 'button#sign-up'
  end

  test 'show a sign in button' do
    assert_select 'button#sign-in'
  end
end
