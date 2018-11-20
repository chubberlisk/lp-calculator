class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :rememberable, :registerable, :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :validatable
end
