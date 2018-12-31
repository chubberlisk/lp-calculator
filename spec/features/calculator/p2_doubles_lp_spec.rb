require 'rails_helper'

RSpec.feature 'Player Two doubles their LP', type: :feature, js: true do
  scenario 'when their current life points is equal to 8000' do
    given_player_two_is_on_the_calculator_page
    and_their_current_lp_is_eight_thousand
    when_they_click_the_lp_button_twice
    and_they_use_the_multiply_by_two_button
    then_their_lp_is_sixteen_thousand
  end

  def given_player_two_is_on_the_calculator_page
    visit calculator_path
    find('button#add-player-two').click
    find('button#add-player-two-guest').click
    find('button#add-player-two-modal-close').click # must force
  end

  def and_their_current_lp_is_eight_thousand
    page.execute_script("$('p#player-two-lp').html(8000)")
  end

  def when_they_click_the_lp_button_twice
    find('button#player-two-show-lp-btns').click
    find('button#player-two-show-lp-btns').click
  end

  def and_they_use_the_multiply_by_two_button
    find('button#player-two-lp-double').click
    find('button#player-two-lp-confirm').click
  end

  def then_their_lp_is_sixteen_thousand
    within('p#player-two-lp') do
      expect(page).to have_text('16000', exact: true)
    end
  end
end