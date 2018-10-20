require 'application_system_test_case'

class CalculatorTest < ApplicationSystemTestCase
  # Reducing life points of player one
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

  # Increasing life points of player one
  test 'can increase life points of player one by 1000' do
    visit calculator_url
    find('button#player-one-lp-plus-one-thousand').click
    within('p#player-one-lp') do
      assert_text '9000', options={:exact => true}
    end
  end

  test 'can increase life points of player one by 500' do
    visit calculator_url
    find('button#player-one-lp-plus-five-hundred').click
    within('p#player-one-lp') do
      assert_text '8500', options={:exact => true}
    end
  end

  test 'can increase life points of player one by 100' do
    visit calculator_url
    find('button#player-one-lp-plus-one-hundred').click
    within('p#player-one-lp') do
      assert_text '8100', options={:exact => true}
    end
  end

  test 'can increase life points of player one by 10' do
    visit calculator_url
    find('button#player-one-lp-plus-ten').click
    within('p#player-one-lp') do
      assert_text '8010', options={:exact => true}
    end
  end

  # Adding player two
  test 'can add player two' do
    visit calculator_url
    assert_no_selector 'button#remove-player-two'
    find('button#add-player-two').click
    assert_selector 'div#player-two-section', count: 1
    assert_selector 'button#remove-player-two', count: 1
    assert_no_selector 'button#add-player-two'
  end

  # Reducing life points of player two
  test 'can reduce the life points of player two by 1000' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-lp-minus-one-thousand').click
    within('p#player-two-lp') do
      assert_text '7000', options={:exact => true}
    end
  end

  test 'can reduce the life points of player two by 500' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-lp-minus-five-hundred').click
    within('p#player-two-lp') do
      assert_text '7500', options={:exact => true}
    end
  end

  test 'can reduce the life points of player two by 100' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-lp-minus-one-hundred').click
    within('p#player-two-lp') do
      assert_text '7900', options={:exact => true}
    end
  end

  test 'can reduce the life points of player two by 10' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-lp-minus-ten').click
    within('p#player-two-lp') do
      assert_text '7990', options={:exact => true}
    end
  end

  # Increasing life points of player two
  test 'can increase the life points of player two by 1000' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-lp-plus-one-thousand').click
    within('p#player-two-lp') do
      assert_text '9000', options={:exact => true}
    end
  end

  test 'can increase the life points of player two by 500' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-lp-plus-five-hundred').click
    within('p#player-two-lp') do
      assert_text '8500', options={:exact => true}
    end
  end

  test 'can increase the life points of player two by 100' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-lp-plus-one-hundred').click
    within('p#player-two-lp') do
      assert_text '8100', options={:exact => true}
    end
  end

  test 'can increase the life points of player two by 10' do
    visit calculator_url
    find('button#add-player-two').click
    find('button#player-two-lp-plus-ten').click
    within('p#player-two-lp') do
      assert_text '8010', options={:exact => true}
    end
  end

  # Resetting life points of player one
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
