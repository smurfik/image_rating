class Review < ActiveRecord::Base

  validates :rating, presence: true
  validates :user_id, uniqueness: { scope: :photo_id }
  belongs_to :photo, counter_cache: true
  belongs_to :user

end
