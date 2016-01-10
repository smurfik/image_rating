class Photo < ActiveRecord::Base

  mount_uploader :image_file, ImageFileUploader

  validates :image_file, presence: true

  has_many :reviews, dependent: :destroy
  attr_readonly :reviews_count

  belongs_to :user

end
