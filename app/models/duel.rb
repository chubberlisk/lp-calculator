class Duel < ApplicationRecord
  belongs_to :player_one, class_name: 'User'
  belongs_to :player_two, class_name: 'User'
  has_many :users

  enum status: { started: 0, completed: 1, cancelled: 2 }
end