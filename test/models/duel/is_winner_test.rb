require 'test_helper'

class IsWinnerTest < ActiveSupport::TestCase
  def setup
    @started_duel = build(:started_duel)
    @cancelled_duel = build(:cancelled_duel)
    @duel_p1_winner = build(:completed_duel)
    @duel_p2_winner = build(:completed_duel, player_one_lp: 0, player_two_lp: 8000)
  end

  test 'should return false for player one if started duel' do
    assert_not @started_duel.winner?(@started_duel.player_one)
  end

  test 'should return false for player two if started duel' do
    assert_not @started_duel.winner?(@started_duel.player_two)
  end

  test 'should return false for player one if cancelled duel' do
    assert_not @cancelled_duel.winner?(@cancelled_duel.player_one)
  end

  test 'should return false for player two if cancelled duel' do
    assert_not @cancelled_duel.winner?(@cancelled_duel.player_two)
  end

  test 'should return true for player one if completed duel and player one is winner' do
    assert @duel_p1_winner.winner?(@duel_p1_winner.player_one)
  end

  test 'should return false for player two if completed duel and player one is winner' do
    assert_not @duel_p1_winner.winner?(@duel_p1_winner.player_two)
  end

  test 'should return false for player one if completed duel and player two is winner' do
    assert_not @duel_p2_winner.winner?(@duel_p2_winner.player_one)
  end

  test 'should return true for player two if completed duel and player one is winner' do
    assert @duel_p2_winner.winner?(@duel_p2_winner.player_two)
  end
end
