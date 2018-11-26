require 'application_system_test_case'

class ReturningHomeTest < ApplicationSystemTestCase
  # Returning to LP Calculator home page
  test 'can return to home page from calculator if not signed in' do
    visit calculator_url
    find('a[href="/"]').click
    assert has_current_path?('/')
  end

  test 'can return to profile of player from calculator if signed in' do
    user = create(:user)
    login_as(user)
    visit calculator_url
    find("a[href='/users/#{user.id}']").click
    assert has_current_path?("/users/#{user.id}")
  end
end
