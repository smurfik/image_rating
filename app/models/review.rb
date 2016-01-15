class Review < ActiveRecord::Base

  validates :rating, presence: true
  validates :user_id, uniqueness: { scope: :photo_id }
  validate :cannot_review_your_own_photos
  belongs_to :photo, counter_cache: true
  belongs_to :user

  def cannot_review_your_own_photos
    if photo.user_id == user_id
      errors.add(:review, "can't review your own photo")
    end
  end

end
