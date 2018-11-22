require 'application_system_test_case'

class ReturningHomeTest < ApplicationSystemTestCase
  # Returning to LP Calculator home page
  test 'can return to home page from calculator' do
    visit calculator_url
    find('a[href="/"]').click
    assert has_current_path?('/')
  end
end
