require 'application_system_test_case'

class ResettingLpPlayerOneTest < ApplicationSystemTestCase
  # Resetting life points
  test 'can reset the life points of player one to 8000' do
    visit calculator_url
    page.execute_script('$("p#player-one-lp").html(7000)')
    accept_confirm do
      find('button#lp-reset').click
    end
    within('p#player-one-lp') do
      assert_text '8000', options={:exact => true}
    end
  end
end
