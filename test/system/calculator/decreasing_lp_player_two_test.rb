require 'application_system_test_case'

class DecreasingLpPlayerTwoTest < ApplicationSystemTestCase
  # Decreasing life points of player two
  test 'can reduce the life points of player two by 1000' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-lp-minus-one-thousand').click
    find('button#player-two-lp-confirm').click
    within('p#player-two-lp') do
      assert_text '7000', options={:exact => true}
    end
  end

  test 'can reduce the life points of player two by 500' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-lp-minus-five-hundred').click
    find('button#player-two-lp-confirm').click
    within('p#player-two-lp') do
      assert_text '7500', options={:exact => true}
    end
  end

  test 'can reduce the life points of player two by 100' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-lp-minus-one-hundred').click
    find('button#player-two-lp-confirm').click
    within('p#player-two-lp') do
      assert_text '7900', options={:exact => true}
    end
  end

  test 'can reduce the life points of player two by 10' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-lp-minus-ten').click
    find('button#player-two-lp-confirm').click
    within('p#player-two-lp') do
      assert_text '7990', options={:exact => true}
    end
  end

  test 'the life points of player two equals 0 when -1000 is clicked 8 times' do
    visit calculator_url
    find('button#add-player-two').click
    for i in 0..7 do
      find('button#player-two-lp-minus-one-thousand').click
      find('button#player-two-lp-confirm').click
    end
    within('p#player-two-lp') do
      assert_text '0', options={:exact => true}
    end
  end

  test 'the life points of player two equals 0 when -1000 is clicked 9 times' do
    visit calculator_url
    find('button#add-player-two').click
    for i in 0..8 do
      find('button#player-two-lp-minus-one-thousand').click
      find('button#player-two-lp-confirm').click
    end
    within('p#player-two-lp') do
      assert_text '0', options={:exact => true}
    end
  end

  test 'the life points of player two equals 0 when a button value is more than current life points' do
    visit calculator_url
    find('button#add-player-two').click
    page.execute_script('$("p#player-two-lp").html(500)')
    find('button#player-two-lp-minus-one-thousand').click
    find('button#player-two-lp-confirm').click
    within('p#player-two-lp') do
      assert_text '0', options={:exact => true}
    end
  end
end