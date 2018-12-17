require 'rails_helper'

RSpec.feature 'User removes Player Two', type: :feature, js: true do
  feature 'when they are not signed in' do
    scenario 'as a guest' do
      given_a_user_is_on_the_calculator_page
      and_player_two_is_added_as_a_guest
      when_they_click_remove_player_two
      then_they_cannot_see_player_two_section
      and_they_see_add_the_player_two_button
    end
  end

  feature 'when they are signed in' do
    let(:player_one) { create(:user_one) }
    let(:player_two) { create(:user_two) }

    scenario 'as a guest' do
      given_a_signed_in_user_is_on_the_calculator_page
      and_player_two_is_added_as_a_guest
      when_they_click_remove_player_two
      then_they_cannot_see_player_two_section
      and_they_see_add_the_player_two_button
    end

    scenario 'as another account' do
      given_a_signed_in_user_is_on_the_calculator_page
      and_player_two_is_added_as_another_account
      when_they_click_remove_player_two
      then_they_cannot_see_player_two_section
      and_they_see_add_the_player_two_button
    end
  end

  def given_a_user_is_on_the_calculator_page
    visit calculator_path
  end

  def given_a_signed_in_user_is_on_the_calculator_page
    login_as(player_one)
    visit calculator_path
  end

  def and_player_two_is_added_as_a_guest
    find('button#add-player-two').click
    find('button#add-player-two-guest').click
    find('button#add-player-two-modal-close').click # must force
  end

  def and_player_two_is_added_as_another_account
    find('button#add-player-two').click
    find('button#add-player-two-account').click
    fill_in('player_two[email]', with: player_two.email)
    fill_in('player_two[password]', with: player_two.password)
    click_on('Add')
  end

  def when_they_click_remove_player_two
    accept_confirm do
      find('button#remove-player-two').click
    end
  end

  def then_they_cannot_see_player_two_section
    expect(page).to have_none_of_selectors('div#player-two-section')
  end

  def and_they_see_add_the_player_two_button
    expect(page).to have_selector('button#add-player-two', count: 1)
  end
end