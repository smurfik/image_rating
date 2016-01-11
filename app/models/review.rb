class Review < ActiveRecord::Base

  validates :rating, presence: true
  belongs_to :photo, counter_cache: true
  belongs_to :user

end
