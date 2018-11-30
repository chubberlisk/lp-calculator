require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  def setup
    @started_duel = build(:started_duel)
    @completed_duel = build(:completed_duel)
    @cancelled_duel = build(:cancelled_duel)
  end

  test 'should return started for status of started duel' do
    assert_equal 'started', @started_duel.status
  end

  test 'should return completed for status of completed duel' do
    assert_equal 'completed', @completed_duel.status
  end

  test 'should return cancelled for status of cancelled duel' do
    assert_equal 'cancelled', @cancelled_duel.status
  end

  test 'should return true for started duel when asking if started' do
    assert @started_duel.started?
  end

  test 'should return false for completed duel when asking if started' do
    assert_not @completed_duel.started?
  end

  test 'should return false for cancelled duel when asking if started' do
    assert_not @cancelled_duel.started?
  end

  test 'should return true for completed duel when asking if completed' do
    assert @completed_duel.completed?
  end

  test 'should return false for started duel when asking if completed' do
    assert @started_duel.started?
  end

  test 'should return false for cancelled duel when asking if completed' do
    assert_not @completed_duel.started?
  end
end
