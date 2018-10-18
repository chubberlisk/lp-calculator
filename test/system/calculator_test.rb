require 'application_system_test_case'

class CalculatorTest < ApplicationSystemTestCase
  # Reducing life points of player one
  test 'can reduce the life points of player one by 1000' do
    visit calculator_url
    click_button '- 1000'
    assert_text 'p#player-one-lp', '7000'
  end

  test 'can reduce the life points of player one by 500' do
    visit calculator_url
    click_button '- 500'
    within('p#player-one-lp') do
      assert_text '7500', options={:exact => true}
    end
  end

  test 'can reduce the life points of player one by 100' do
    visit calculator_url
    click_button '- 100'
    within('p#player-one-lp') do
      assert_text '7900', options={:exact => true}
    end
  end

  test 'can reduce the life points of player one by 10' do
    visit calculator_url
    click_button '- 10'
    within('p#player-one-lp') do
      assert_text '7990', options={:exact => true}
    end
  end

  test 'the life points of player one equals 0 when -1000 is clicked 8 times' do
    visit calculator_url
    for i in 0..7 do
      click_button '- 1000'
    end
    within('p#player-one-lp') do
      assert_text '0', options={:exact => true}
    end
  end

  test 'the life points of player one equals 0 when -1000 is clicked 9 times' do
    visit calculator_url
    for i in 0..8 do
      click_button '- 1000'
    end
    within('p#player-one-lp') do
      assert_text '0', options={:exact => true}
    end
  end

  test 'the life points of player one equals 0 when a button value is more than current life points' do
    visit calculator_url
    page.execute_script('$("p#player-one-lp").html(500)')
    click_button '- 1000'
    within('p#player-one-lp') do
      assert_text '0', options={:exact => true}
    end
  end

  # Resetting life points of player one
  test 'can reset the life points of player one to 8000' do
    visit calculator_url
    page.execute_script('$("p#player-one-lp").html(7000)')
    accept_confirm do
      click_button 'Reset'
    end
    within('p#player-one-lp') do
      assert_text '8000', options={:exact => true}
    end
  end

  # Increasing life points of player one
  # test 'can increase life points of player one by 1000' do
  #   visit calculator_url
  #   click_button '+ 1000'
  #   within('p#player-one-lp') do
  #     assert_text '9000', options={:exact => true}
  #   end
  # end
end
