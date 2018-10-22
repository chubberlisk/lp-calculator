require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index if welcome_url named helper used" do
    get welcome_url
    assert_response :success
  end

  test "should get index if root_url named helper used" do
    get root_url
    assert_response :success
  end
end
