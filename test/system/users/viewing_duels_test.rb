require 'application_system_test_case'

class ViewingDuelsTest < ApplicationSystemTestCase
  def setup
    @chandler = create(:chandler)
    @monica = create(:monica)
    login_as(@chandler)
    @started_duel = create(:started_duel, player_one: @chandler, player_two: @monica)
    @cancelled_duel = create(:cancelled_duel, player_one: @chandler, player_two: @monica)
    @duel_p1_winner = create(:completed_duel, player_one: @chandler, player_two: @monica)
    @duel_p1_winner_list = create_list(:completed_duel, 5, player_one: @chandler, player_two: @monica)
    @duel_p2_winner = create(:completed_duel, player_one: @chandler, player_two: @monica, player_one_lp: 0, player_two_lp: 8000)
    @duel_p2_winner_list = create_list(:completed_duel, 5, player_one: @chandler, player_two: @monica, player_one_lp: 0, player_two_lp: 8000)
    visit user_profile_path(@chandler)
  end

  test 'can see a won completed duel' do
    within("#duel-#{@duel_p1_winner.id}") do
      assert_text "Won Against #{@monica.username}"
      assert_text "Starting LP: #{@duel_p1_winner.starting_lp}"
      assert_text 'Remaining LP: 8000'
      assert_text "Duel Time: #{@duel_p1_winner.time}"
    end
  end

  test 'can see many won completed duels' do
    @duel_p1_winner_list.each do |duel_p1_winner|
      within("#duel-#{duel_p1_winner.id}") do
        assert_text "Won Against #{@monica.username}"
        assert_text "Starting LP: #{duel_p1_winner.starting_lp}"
        assert_text 'Remaining LP: 8000'
        assert_text "Duel Time: #{duel_p1_winner.time}"
      end
    end
  end

  test 'can see a lost completed duel' do
    within("#duel-#{@duel_p2_winner.id}") do
      assert_text "Lost Against #{@monica.username}"
      assert_text "Starting LP: #{@duel_p2_winner.starting_lp}"
      assert_text 'Opponent\'s Remaining LP: 8000'
      assert_text "Duel Time: #{@duel_p2_winner.time}"
    end
  end

  test 'can see many lost completed duels' do
    @duel_p2_winner_list.each do |duel_p2_winner|
      within("#duel-#{duel_p2_winner.id}") do
        assert_text "Lost Against #{@monica.username}"
        assert_text "Starting LP: #{duel_p2_winner.starting_lp}"
        assert_text 'Opponent\'s Remaining LP: 8000'
        assert_text "Duel Time: #{duel_p2_winner.time}"
      end
    end
  end

  test 'cannot see started duels' do
    assert_no_selector "#duel-#{@started_duel.id}"
  end

  test 'cannot see cancelled duels' do
    assert_no_selector "#duel-#{@cancelled_duel.id}"
  end
end