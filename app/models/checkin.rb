class Checkin < ActiveRecord::Base
  belongs_to :user
  belongs_to :business

  validates :user_id, :business_id, presence: true
  validates :user_id, uniqueness: {scope: :business_id, message: "you already signed in here"} if :already_checked_in? 

  def already_checked_in?
    last_similar_checkin = Checkin.where(user_id: user_id, business_id: business_id).last

    if last_similar_checkin.created_at + 1.hour >= Time.now
      return false
    else
      return true
    end
  end

end
