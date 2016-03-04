class User < ActiveRecord::Base
  has_many :checkins
  has_many :businesses, through: :checkins

  validates :name, :email, presence: true
end
