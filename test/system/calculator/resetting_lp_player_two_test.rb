require 'application_system_test_case'

class ResettingLpTest < ApplicationSystemTestCase
  # Resetting life points
  test 'can reset the life points of player two to 8000' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#add-player-two-guest').click
    find('button#add-player-two-modal-close').click
    page.execute_script('$("p#player-two-lp").html(7000)')
    accept_confirm do
      find('button#lp-reset').click
    end
    within('p#player-two-lp') do
      assert_text '8000', options={:exact => true}
    end
  end
end
