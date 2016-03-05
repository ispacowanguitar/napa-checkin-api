class Checkin < ActiveRecord::Base
  belongs_to :user
  belongs_to :business

  validates :user_id, :business_id, presence: true
  validate :already_checked_in? 

  def already_checked_in?
    last_similar_checkin = Checkin.where(user_id: user_id, business_id: business_id).last
    if last_similar_checkin && last_similar_checkin.created_at + 1.hour >= created_at
      errors.add(:created_at, "can't be in the past")
    end
  end

end
