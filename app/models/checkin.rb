class Checkin < ActiveRecord::Base
  belongs_to :user
  belongs_to :business

  validates :user_id, :business_id, presence: true
  validate :user_cannot_check_in_twice 

  def user_cannot_check_in_twice
    last_similar_checkin = Checkin.where(user_id: user_id, business_id: business_id).last
    if last_similar_checkin && last_similar_checkin.created_at + 1.hour >= created_at
      errors.add(:created_at, "can't sign in twice at the same location")
    end
  end

end
