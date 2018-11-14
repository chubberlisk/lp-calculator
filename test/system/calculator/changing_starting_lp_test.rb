require 'application_system_test_case'

class ChangingStartingLpTest < ApplicationSystemTestCase
  # Changing the starting value of life points for both players
  def setup
    visit calculator_url
    find('button#lp-starting').click
  end

  test 'can change starting life points to 4000' do
    find('input#lp-starting-radio-four-thousand').choose
    find('button#lp-starting-modal-close').click
    accept_confirm do
      find('button#lp-reset').click
    end
    within('p#player-one-lp') do
      assert_text '4000', options={:exact => true}
    end
  end

  test 'can change starting life points to 2000' do
    find('input#lp-starting-radio-two-thousand').choose
    find('button#lp-starting-modal-close').click
    accept_confirm do
      find('button#lp-reset').click
    end
    within('p#player-one-lp') do
      assert_text '2000', options={:exact => true}
    end
  end

  test 'can change starting life points to 8000 after changing to 4000' do
    find('input#lp-starting-radio-four-thousand').choose
    find('button#lp-starting-modal-close').click
    find('button#lp-starting').click
    find('input#lp-starting-radio-eight-thousand').choose
    find('button#lp-starting-modal-close').click
    accept_confirm do
      find('button#lp-reset').click
    end
    within('p#player-one-lp') do
      assert_text '8000', options={:exact => true}
    end
  end
end
