require 'application_system_test_case'

class PlayerTwoTest < ApplicationSystemTestCase
  def setup
    visit calculator_url
    find('button#add-player-two').click
  end
end