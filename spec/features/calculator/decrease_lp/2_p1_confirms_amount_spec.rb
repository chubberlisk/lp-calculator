require 'rails_helper'

RSpec.feature 'Decrease LP Step 2: Player One confirms amount', type: :feature, js: true do
  scenario 'to decrease by 1000' do
    given_a_user_is_on_the_calculator_page
    when_player_one_confirms_for_minus_one_thousand
    then_their_life_points_decreases_by_one_thousand
  end

  scenario 'to decrease by 500' do
    given_a_user_is_on_the_calculator_page
    when_player_one_confirms_for_minus_five_hundred
    then_their_life_points_decreases_by_five_hundred
  end

  scenario 'to decrease by 100' do
    given_a_user_is_on_the_calculator_page
    when_player_one_confirms_for_minus_one_hundred
    then_their_life_points_decreases_by_one_hundred
  end

  scenario 'to decrease by 10' do
    given_a_user_is_on_the_calculator_page
    when_player_one_confirms_for_minus_ten
    then_their_life_points_decreases_by_ten
  end

  scenario 'to decrease by 1610' do
    given_a_user_is_on_the_calculator_page
    when_player_one_confirms_for_minus_one_thousand_six_hundred_and_ten
    then_their_life_points_decreases_by_one_thousand_six_hundred_and_ten
  end

  scenario 'to decrease by 8000' do
    given_a_user_is_on_the_calculator_page
    when_player_one_confirms_for_minus_eight_thousand
    then_their_life_points_decreases_by_eight_thousand
  end

  def given_a_user_is_on_the_calculator_page
    visit calculator_path
  end

  def when_player_one_confirms_for_minus_one_thousand
    find('button#player-one-lp-minus-one-thousand').click
    find('button#player-one-lp-confirm').click
  end

  def when_player_one_confirms_for_minus_five_hundred
    find('button#player-one-lp-minus-five-hundred').click
    find('button#player-one-lp-confirm').click
  end

  def when_player_one_confirms_for_minus_one_hundred
    find('button#player-one-lp-minus-one-hundred').click
    find('button#player-one-lp-confirm').click
  end

  def when_player_one_confirms_for_minus_ten
    find('button#player-one-lp-minus-ten').click
    find('button#player-one-lp-confirm').click
  end

  def when_player_one_confirms_for_minus_eight_thousand
    (0..7).each { find('button#player-one-lp-minus-one-thousand').click }
    dismiss_confirm do
      find('button#player-one-lp-confirm').click
    end
  end

  def when_player_one_confirms_for_minus_one_thousand_six_hundred_and_ten
    find('button#player-one-lp-minus-one-thousand').click
    find('button#player-one-lp-minus-five-hundred').click
    find('button#player-one-lp-minus-one-hundred').click
    find('button#player-one-lp-minus-ten').click
    find('button#player-one-lp-confirm').click
  end

  def then_their_life_points_decreases_by_one_thousand
    within('p#player-one-lp') do
      expect(page).to have_text('7000', exact: true)
    end
  end

  def then_their_life_points_decreases_by_five_hundred
    within('p#player-one-lp') do
      expect(page).to have_text('7500', exact: true)
    end
  end

  def then_their_life_points_decreases_by_one_hundred
    within('p#player-one-lp') do
      expect(page).to have_text('7900', exact: true)
    end
  end

  def then_their_life_points_decreases_by_ten
    within('p#player-one-lp') do
      expect(page).to have_text('7990', exact: true)
    end
  end

  def then_their_life_points_decreases_by_one_thousand_six_hundred_and_ten
    within('p#player-one-lp') do
      expect(page).to have_text('6390', exact: true)
    end
  end

  def then_their_life_points_decreases_by_eight_thousand
    within('p#player-one-lp') do
      expect(page).to have_text('0', exact: true)
    end
  end
end