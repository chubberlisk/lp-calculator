require 'rails_helper'

RSpec.feature 'Decrease LP Step 1: Player One sets amount', type: :feature, js: true do
  scenario 'to decrease by 1000' do
    given_a_user_is_on_the_calculator_page
    when_player_one_clicks_for_minus_one_thousand
    then_they_see_one_thousand_to_decrease
  end

  scenario 'to decrease by 500' do
    given_a_user_is_on_the_calculator_page
    when_player_one_clicks_for_minus_five_hundred
    then_they_see_five_hundred_to_decrease
  end

  scenario 'to decrease by 100' do
    given_a_user_is_on_the_calculator_page
    when_player_one_clicks_for_minus_one_hundred
    then_they_see_one_hundred_to_decrease
  end

  scenario 'to decrease by 10' do
    given_a_user_is_on_the_calculator_page
    when_player_one_clicks_for_minus_ten
    then_they_see_ten_to_decrease
  end

  scenario 'to decrease by 1610' do
    given_a_user_is_on_the_calculator_page
    when_player_one_clicks_for_minus_one_thousand_six_hundred_and_ten
    then_they_see_one_thousand_six_hundred_and_ten_to_decrease
  end

  scenario 'to decrease by clicking -1000 button 8 times' do
    given_a_user_is_on_the_calculator_page
    when_player_one_clicks_for_minus_one_thousand_eight_times
    then_they_see_eight_thousand_to_decrease
  end

  scenario 'to decrease by clicking -1000 button 9 times' do
    given_a_user_is_on_the_calculator_page
    when_player_one_clicks_for_minus_one_thousand_nine_times
    then_they_see_eight_thousand_to_decrease
  end

  scenario 'to decrease using a button value which is more than their current life points' do
    given_a_user_is_on_the_calculator_page
    and_their_life_points_is_equal_to_five_hundred
    when_player_one_clicks_for_minus_one_thousand
    then_they_see_five_hundred_to_decrease
  end
  
  scenario 'and cancels life points to decrease' do
    given_a_user_is_on_the_calculator_page
    when_player_one_clicks_for_minus_one_thousand
    and_they_click_cancel
    then_they_dont_see_an_amount_to_decrease
  end

  def given_a_user_is_on_the_calculator_page
    visit calculator_path
  end

  def and_their_life_points_is_equal_to_five_hundred
    page.execute_script('$("p#player-one-lp").html(500)')
  end

  def when_player_one_clicks_for_minus_one_thousand
    find('button#player-one-lp-minus-one-thousand').click
  end

  def when_player_one_clicks_for_minus_five_hundred
    find('button#player-one-lp-minus-five-hundred').click
  end

  def when_player_one_clicks_for_minus_one_hundred
    find('button#player-one-lp-minus-one-hundred').click
  end

  def when_player_one_clicks_for_minus_ten
    find('button#player-one-lp-minus-ten').click
  end

  def when_player_one_clicks_for_minus_one_thousand_six_hundred_and_ten
    find('button#player-one-lp-minus-one-thousand').click
    find('button#player-one-lp-minus-five-hundred').click
    find('button#player-one-lp-minus-one-hundred').click
    find('button#player-one-lp-minus-ten').click
  end

  def when_player_one_clicks_for_minus_one_thousand_eight_times
    (0..7).each { find('button#player-one-lp-minus-one-thousand').click }
  end

  def when_player_one_clicks_for_minus_one_thousand_nine_times
    (0..8).each { find('button#player-one-lp-minus-one-thousand').click }
  end

  def and_they_click_cancel
    find('button#player-one-lp-cancel').click
  end

  def then_they_see_one_thousand_to_decrease
    within('span#player-one-lp-change') do
      expect(page).to have_text('-1000', exact: true)
    end
  end

   def then_they_see_five_hundred_to_decrease
    within('span#player-one-lp-change') do
      expect(page).to have_text('-500', exact: true)
    end
  end

  def then_they_see_one_hundred_to_decrease
    within('span#player-one-lp-change') do
      expect(page).to have_text('-100', exact: true)
    end
  end

  def then_they_see_ten_to_decrease
    within('span#player-one-lp-change') do
      expect(page).to have_text('-10', exact: true)
    end
  end

  def then_they_see_one_thousand_six_hundred_and_ten_to_decrease
    within('span#player-one-lp-change') do
      expect(page).to have_text('-1610', exact: true)
    end
  end

  def then_they_see_eight_thousand_to_decrease
    within('span#player-one-lp-change') do
     expect(page).to have_text('-8000', exact: true)
    end
  end

  def then_they_dont_see_an_amount_to_decrease
    expect(page).to have_none_of_selectors('span#player-one-lp-change')
  end
end