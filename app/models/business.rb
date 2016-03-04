class Business < ActiveRecord::Base
  has_many :checkins
  has_many :users, :through => :checkins

  validates :name, :phone_number, :address, presence: true
end
