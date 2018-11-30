require 'test_helper'

class WinnerTest < ActiveSupport::TestCase
  test 'should return error message if started duel' do
    started_duel = build(:started_duel)
    assert_equal ['no winner as duel not completed'], started_duel.winner
  end

  test 'should return error message if cancelled duel' do
    cancelled_duel = build(:cancelled_duel)
    assert_equal ['no winner as duel not completed'], cancelled_duel.winner
  end

  test 'should return player one' do
    duel_p1_winner = build(:completed_duel)
    assert_same duel_p1_winner.player_one, duel_p1_winner.winner
  end

  test 'should return player two' do
    duel_p2_winner = build(:completed_duel, player_one_lp: 0, player_two_lp: 8000)
    assert_same duel_p2_winner.player_two, duel_p2_winner.winner
  end
end
