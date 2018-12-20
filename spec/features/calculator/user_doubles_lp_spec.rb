require 'rails_helper'

RSpec.feature 'User doubles their LP', type: :feature, js: true do
  scenario 'when their current life points is equal to 8000' do
    given_a_user_is_on_the_calculator_page
    and_their_current_lp_is_eight_thousand
    when_they_click_the_lp_button_twice
    and_they_use_the_multiply_by_two_button
    then_their_lp_is_sixteen_thousand
  end

  scenario 'when their current life points is equal to 4000' do
    given_a_user_is_on_the_calculator_page
    and_their_current_lp_is_four_thousand
    when_they_click_the_lp_button_twice
    and_they_use_the_multiply_by_two_button
    then_their_lp_is_eight_thousand
  end

  scenario 'when their current life points is equal to 2000' do
    given_a_user_is_on_the_calculator_page
    and_their_current_lp_is_two_thousand
    when_they_click_the_lp_button_twice
    and_they_use_the_multiply_by_two_button
    then_their_lp_is_four_thousand
  end

  scenario 'when their current life points is equal to 9' do
    given_a_user_is_on_the_calculator_page
    and_their_current_lp_is_nine
    when_they_click_the_lp_button_twice
    and_they_use_the_multiply_by_two_button
    then_their_lp_is_eighteen
  end

  def given_a_user_is_on_the_calculator_page
    visit calculator_path
  end

  def and_their_current_lp_is_eight_thousand
    page.execute_script("$('p#player-one-lp').html(8000)")
  end

  def and_their_current_lp_is_four_thousand
    page.execute_script("$('p#player-one-lp').html(4000)")
  end

  def and_their_current_lp_is_two_thousand
    page.execute_script("$('p#player-one-lp').html(2000)")
  end

  def and_their_current_lp_is_nine
    page.execute_script("$('p#player-one-lp').html(9)")
  end

  def when_they_click_the_lp_button_twice
    find('button#player-one-show-lp-btns').click
    find('button#player-one-show-lp-btns').click
  end

  def and_they_use_the_multiply_by_two_button
    find('button#player-one-lp-double').click
    find('button#player-one-lp-confirm').click
  end

  def then_their_lp_is_sixteen_thousand
    within('p#player-one-lp') do
      expect(page).to have_text('16000', exact: true)
    end
  end

  def then_their_lp_is_eight_thousand
    within('p#player-one-lp') do
      expect(page).to have_text('8000', exact: true)
    end
  end

  def then_their_lp_is_four_thousand
    within('p#player-one-lp') do
      expect(page).to have_text('4000', exact: true)
    end
  end

  def then_their_lp_is_eighteen
    within('p#player-one-lp') do
      expect(page).to have_text('18', exact: true)
    end
  end
end