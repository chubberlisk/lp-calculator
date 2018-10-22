require 'application_system_test_case'

class DecreasingLpPlayerOneTest < ApplicationSystemTestCase
  # Decreasing life points of player one
  test 'can reduce the life points of player one by 1000' do
    visit calculator_url
    find('button#player-one-lp-minus-one-thousand').click
    within('p#player-one-lp') do
      assert_text '7000', options={:exact => true}
    end
  end

  test 'can reduce the life points of player one by 500' do
    visit calculator_url
    find('button#player-one-lp-minus-five-hundred').click
    within('p#player-one-lp') do
      assert_text '7500', options={:exact => true}
    end
  end

  test 'can reduce the life points of player one by 100' do
    visit calculator_url
    find('button#player-one-lp-minus-one-hundred').click
    within('p#player-one-lp') do
      assert_text '7900', options={:exact => true}
    end
  end

  test 'can reduce the life points of player one by 10' do
    visit calculator_url
    find('button#player-one-lp-minus-ten').click
    within('p#player-one-lp') do
      assert_text '7990', options={:exact => true}
    end
  end

  test 'the life points of player one equals 0 when -1000 is clicked 8 times' do
    visit calculator_url
    for i in 0..7 do
      find('button#player-one-lp-minus-one-thousand').click
    end
    within('p#player-one-lp') do
      assert_text '0', options={:exact => true}
    end
  end

  test 'the life points of player one equals 0 when -1000 is clicked 9 times' do
    visit calculator_url
    for i in 0..8 do
      find('button#player-one-lp-minus-one-thousand').click
    end
    within('p#player-one-lp') do
      assert_text '0', options={:exact => true}
    end
  end

  test 'the life points of player one equals 0 when a button value is more than current life points' do
    visit calculator_url
    page.execute_script('$("p#player-one-lp").html(500)')
    find('button#player-one-lp-minus-one-thousand').click
    within('p#player-one-lp') do
      assert_text '0', options={:exact => true}
    end
  end
end