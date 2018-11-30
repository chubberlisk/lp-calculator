require 'test_helper'

class OpponentTest < ActiveSupport::TestCase
  def setup
    @duel = build(:duel)
  end

  test 'should return player two if user is player one' do
    assert_equal @duel.player_two, @duel.opponent(@duel.player_one)
  end

  test 'should return player one if user is player two' do
    assert_equal @duel.player_one, @duel.opponent(@duel.player_two)
  end
end
