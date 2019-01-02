require 'rails_helper'

RSpec.feature 'User changes starting LP', type: :feature, js: true do
  scenario 'to 4000' do
    given_a_user_is_on_the_calculator_page
    and_player_two_is_added
    when_they_click_to_change_to_four_thousand
    and_reset_life_points
    then_both_players_start_with_four_thousand_life_points
  end

  scenario 'to 2000' do
    given_a_user_is_on_the_calculator_page
    and_player_two_is_added
    when_they_click_to_change_to_two_thousand
    and_reset_life_points
    then_both_players_start_with_two_thousand_life_points
  end

  scenario 'to 8000 after changing it to 4000' do
    given_a_user_is_on_the_calculator_page
    and_player_two_is_added
    when_they_click_to_change_to_four_thousand
    and_reset_life_points
    and_change_to_eight_thousand
    and_reset_life_points
    then_both_players_start_with_eight_thousand_life_points
  end

  def given_a_user_is_on_the_calculator_page
    visit calculator_path
  end

  def and_player_two_is_added
    find('button#add-player-two').click
    find('button#add-player-two-guest').click
    find('button#add-player-two-modal-close').click # must force
  end

  def when_they_click_to_change_to_four_thousand
    find('button#lp-starting').click
    find('input#lp-starting-radio-four-thousand').choose
    find('button#lp-starting-modal-close').click # must force
  end

  def when_they_click_to_change_to_two_thousand
    find('button#lp-starting').click
    find('input#lp-starting-radio-two-thousand').choose
    find('button#lp-starting-modal-close').click # must force
  end

  def and_change_to_eight_thousand
    find('button#lp-starting').click
    find('input#lp-starting-radio-eight-thousand').choose
    find('button#lp-starting-modal-close').click # must force
  end

  def and_reset_life_points
    accept_confirm do
      find('button#lp-reset').click
    end
  end

  def then_both_players_start_with_four_thousand_life_points
    within('p#player-one-lp') do
      assert_text '4000', options={:exact => true}
    end

    within('p#player-two-lp') do
      assert_text '4000', options={:exact => true}
    end
  end

  def then_both_players_start_with_two_thousand_life_points
    within('p#player-one-lp') do
      assert_text '2000', options={:exact => true}
    end

    within('p#player-two-lp') do
      assert_text '2000', options={:exact => true}
    end
  end

  def then_both_players_start_with_eight_thousand_life_points
    within('p#player-one-lp') do
      assert_text '8000', options={:exact => true}
    end

    within('p#player-two-lp') do
      assert_text '8000', options={:exact => true}
    end
  end
end