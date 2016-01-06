class Photo < ActiveRecord::Base

  mount_uploader :image_file, ImageFileUploader

  validates :image_file, presence: true

  has_many :comments
  belongs_to :user

end
