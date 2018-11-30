require 'test_helper'

class OpponentsLpTest < ActiveSupport::TestCase
  def setup
    @started_duel = build(:started_duel)
    @cancelled_duel = build(:cancelled_duel)
    @duel_p1_winner = build(:completed_duel)
    @duel_p2_winner = build(:completed_duel, player_one_lp: 0, player_two_lp: 8000)
  end

  test 'should return nil for a started duel if player one' do
    assert_nil @started_duel.opponents_lp(@started_duel.player_one)
  end

  test 'should return nil for a started duel if player two' do
    assert_nil @started_duel.opponents_lp(@started_duel.player_two)
  end

  test 'should return nil for a cancelled duel if player one' do
    assert_nil @cancelled_duel.opponents_lp(@cancelled_duel.player_one)
  end

  test 'should return nil for a cancelled duel if player two' do
    assert_nil @cancelled_duel.opponents_lp(@cancelled_duel.player_two)
  end

  test 'should return 0 for a completed duel when player one is winner if player one' do
    assert_equal 0, @duel_p1_winner.opponents_lp(@duel_p1_winner.player_one)
  end

  test 'should return 8000 for a completed duel when player one is winner if player one' do
    assert_equal 8000, @duel_p1_winner.opponents_lp(@duel_p1_winner.player_two)
  end

  test 'should return 8000 for a completed duel when player two is winner if player one' do
    assert_equal 8000, @duel_p2_winner.opponents_lp(@duel_p2_winner.player_one)
  end

  test 'should return 0 for a completed duel when player two is winner if player one' do
    assert_equal 0, @duel_p2_winner.opponents_lp(@duel_p2_winner.player_two)
  end

end
