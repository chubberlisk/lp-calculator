require 'application_system_test_case'

class PlayerOneTest < ApplicationSystemTestCase
  def setup
    visit calculator_url
  end
end