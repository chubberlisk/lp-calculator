require 'system/calculator/player_two_test'

class ResettingLpTest < PlayerTwoTest
  # Resetting life points
  test 'can reset the life points of player two to 8000' do
    page.execute_script('$("p#player-two-lp").html(7000)')
    accept_confirm do
      find('button#lp-reset').click
    end
    within('p#player-two-lp') do
      assert_text '8000', options={:exact => true}
    end
  end
end
