require 'test_helper'

class TimeTest < ActiveSupport::TestCase
  def setup
    @created_at = Time.new(1997, 3, 1, 18, 0, 0)
  end

  test 'should return error message if started duel' do
    started_duel = build(:started_duel)
    assert_equal ['no time as duel not completed'], started_duel.time
  end

  test 'should return error message if cancelled duel' do
    cancelled_duel = build(:cancelled_duel)
    assert_equal ['no time as duel not completed'], cancelled_duel.time
  end

  test 'should return 0 mins' do
    duel = build(:completed_duel, created_at: @created_at, ended_at: @created_at)
    assert_equal '0 mins', duel.time
  end

  test 'should return 0 mins if 1 second more' do
    ended_at = @created_at.advance(seconds: 1)
    duel = build(:completed_duel, created_at: @created_at, ended_at: ended_at)
    assert_equal '0 mins', duel.time
  end

  test 'should return 1 mins' do
    ended_at = @created_at.advance(minutes: 1)
    duel = build(:completed_duel, created_at: @created_at, ended_at: ended_at)
    assert_equal '1 mins', duel.time
  end

  test 'should return 60 mins' do
    ended_at = @created_at.advance(minutes: 60)
    duel = build(:completed_duel, created_at: @created_at, ended_at: ended_at)
    assert_equal '60 mins', duel.time
  end

  test 'should return 90 mins' do
    ended_at = @created_at.advance(minutes: 90)
    duel = build(:completed_duel, created_at: @created_at, ended_at: ended_at)
    assert_equal '90 mins', duel.time
  end
end
