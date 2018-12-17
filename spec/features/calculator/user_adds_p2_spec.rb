require 'rails_helper'

RSpec.feature 'User adds Player Two', type: :feature, js: true do
  feature 'when they are not signed in' do
    scenario 'they can see the add guest option' do
      given_a_user_is_on_the_calculator_page
      when_they_click_on_the_add_player_two_button
      then_they_see_the_add_guest_button
    end

    scenario 'they cannot see the add account option' do
      given_a_user_is_on_the_calculator_page
      when_they_click_on_the_add_player_two_button
      then_they_cannot_see_the_add_account_button
    end

    scenario 'as a guest' do
      given_a_user_is_on_the_calculator_page
      when_they_click_on_the_add_player_two_button
      and_they_click_to_add_a_guest_player_two
      then_they_see_a_guest_player_two_section
      and_they_see_a_remove_player_two_button
      and_they_cannot_see_an_add_player_two_button_and_modal
    end
  end

  feature 'when they are signed in' do
    let(:player_one) { create(:user_one) }
    let(:player_two) { create(:user_two) }

    scenario 'they can see the add guest option' do
      given_a_signed_in_user_is_on_the_calculator_page
      when_they_click_on_the_add_player_two_button
      then_they_see_the_add_guest_button
    end

    scenario 'they can see the add account option' do
      given_a_signed_in_user_is_on_the_calculator_page
      when_they_click_on_the_add_player_two_button
      then_they_see_the_add_account_button
    end

    scenario 'as a guest' do
      given_a_signed_in_user_is_on_the_calculator_page
      when_they_click_on_the_add_player_two_button
      and_they_click_to_add_a_guest_player_two
      then_they_see_a_guest_player_two_section
      and_they_see_a_remove_player_two_button
      and_they_cannot_see_an_add_player_two_button_and_modal
    end

    scenario 'as another account with valid email and password' do
      given_a_signed_in_user_is_on_the_calculator_page
      when_they_click_on_the_add_player_two_button
      and_they_click_to_add_an_account_player_two
      and_player_two_uses_valid_details
      then_they_see_a_player_two_section_with_an_account
      and_they_see_a_remove_player_two_button
      and_they_cannot_see_an_add_player_two_button_and_modal
    end

    scenario 'they cannot add as another account with a blank form' do
      given_a_signed_in_user_is_on_the_calculator_page
      when_they_click_on_the_add_player_two_button
      and_they_click_to_add_an_account_player_two
      and_they_click_add
      then_they_see_an_error
    end

    scenario 'they cannot add as another account with a valid email and empty password' do
      given_a_signed_in_user_is_on_the_calculator_page
      when_they_click_on_the_add_player_two_button
      and_they_click_to_add_an_account_player_two
      and_player_two_uses_a_valid_email_and_empty_password
      then_they_see_an_error
    end

    scenario 'they cannot add as another account with a valid email and invalid password' do
      given_a_signed_in_user_is_on_the_calculator_page
      when_they_click_on_the_add_player_two_button
      and_they_click_to_add_an_account_player_two
      and_player_two_uses_a_valid_email_and_invalid_password
      then_they_see_an_error
    end

    scenario 'they cannot add as another account with current user account' do
      given_a_signed_in_user_is_on_the_calculator_page
      when_they_click_on_the_add_player_two_button
      and_they_click_to_add_an_account_player_two
      and_player_two_uses_current_user_account
      then_they_see_an_error
    end
  end
  
  def given_a_user_is_on_the_calculator_page
    visit calculator_path
  end

  def given_a_signed_in_user_is_on_the_calculator_page
    login_as(player_one)
    visit calculator_path
  end

  def when_they_click_on_the_add_player_two_button
    find('button#add-player-two').click
  end

  def and_they_click_to_add_a_guest_player_two
    find('button#add-player-two-guest').click
    find('button#add-player-two-modal-close').click # must force
  end

  def and_they_click_to_add_an_account_player_two
    find('button#add-player-two-account').click
  end

  def and_player_two_uses_valid_details
    fill_in('player_two[email]', with: player_two.email)
    fill_in('player_two[password]', with: player_two.password)
    click_on('Add')
  end

  def and_they_click_add
    click_on('Add')
  end

  def and_player_two_uses_a_valid_email_and_empty_password
    fill_in('player_two[email]', with: player_two.email)
    fill_in('player_two[password]', with: '')
    click_on('Add')
  end

  def and_player_two_uses_a_valid_email_and_invalid_password
    fill_in('player_two[email]', with: player_two.email)
    fill_in('player_two[password]', with: 'notpassword')
    click_on('Add')
  end

  def and_player_two_uses_current_user_account
    fill_in('player_two[email]', with: player_one.email)
    fill_in('player_two[password]', with: player_one.password)
    click_on('Add')
  end

  def then_they_see_the_add_guest_button
    expect(page).to have_selector('button#add-player-two-guest', count: 1)
  end

  def then_they_see_the_add_account_button
    expect(page).to have_selector('button#add-player-two-account', count: 1)
  end

  def then_they_cannot_see_the_add_account_button
    expect(page).to have_none_of_selectors('button#add-player-two-account')
  end

  def then_they_see_a_guest_player_two_section
    within('h2#player-two') do
      expect(page).to have_text('PLAYER TWO', exact: true)
    end
    expect(page).to have_selector('div#player-two-section', count: 1)
  end

  def then_they_see_a_player_two_section_with_an_account
    within('h2#player-two') do
      expect(page).to have_text(player_two.username.upcase, exact: true)
    end
    expect(page).to have_selector('div#player-two-section', count: 1)
  end

  def then_they_see_an_error
    within('form#add-player-two-account') do
      expect(page).to have_text('Sorry! Invalid email address or password.')
    end
  end

  def and_they_see_a_remove_player_two_button
    expect(page).to have_selector('button#remove-player-two', count: 1)
  end
  
  def and_they_cannot_see_an_add_player_two_button_and_modal
    expect(page).to have_none_of_selectors('button#add-player-two', '#add-player-two-modal')
  end
end