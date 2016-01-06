class Photo < ActiveRecord::Base

  validates :image_file, presence: true

  has_many :comments
  belongs_to :user

end
