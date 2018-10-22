require 'application_system_test_case'

class ResettingLpTest < ApplicationSystemTestCase
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

  test 'can reset the life points of player two to 8000' do
    visit calculator_url
    find('button#add-player-two').click
    page.execute_script('$("p#player-two-lp").html(7000)')
    accept_confirm do
      find('button#lp-reset').click
    end
    within('p#player-two-lp') do
      assert_text '8000', options={:exact => true}
    end
  end

  # Removing player two
  test 'can remove player two' do
    visit calculator_url
    find('button#add-player-two').click
    accept_confirm do
      find('button#remove-player-two').click
    end
    assert_no_selector 'div#player-two-section'
    assert_selector 'button#add-player-two', count: 1
  end
end
