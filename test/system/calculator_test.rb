require 'application_system_test_case'

class CalculatorTest < ApplicationSystemTestCase
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
end
