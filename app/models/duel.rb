class Duel < ApplicationRecord
  belongs_to :player_one, class_name: 'User'
  belongs_to :player_two, class_name: 'User'
  has_many :users

  enum status: { started: 0, completed: 1, cancelled: 2 }

  scope :was_player_one, ->(user) { where(player_one: user) }
  scope :was_player_two, ->(user) { where(player_two: user) }
  scope :my_started, ->(user) { was_player_one(user).or(was_player_two(user)).where(status: :started) }
  scope :my_completed, ->(user) { was_player_one(user).or(was_player_two(user)).where(status: :completed) }
  scope :my_cancelled, ->(user) { was_player_one(user).or(was_player_two(user)).where(status: :cancelled) }

  def winner
    return errors.add(:winner, 'no winner as duel not completed') unless completed?
    player_one_lp > player_two_lp ? player_one : player_two
  end

  def winner?(user)
    return errors.add(:winner, 'no winner as duel not completed') unless completed?
    winner == user
  end

  def opponent(user)
    player_one == user ? player_two : player_one
  end

  def opponents_lp(user)
    player_one == user ? player_two_lp : player_one_lp
  end

  def my_lp(user)
    return errors.add(:my_lp, 'user is not a player in this duel') unless player_one == user || player_two == user
    player_one == user ? player_one_lp : player_two_lp
  end

  def time
    return errors.add(:time, 'no time as duel not completed') unless completed?
    "#{((ended_at - created_at) / 1.minutes).round} mins"
  end
end