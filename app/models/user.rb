class User < ActiveRecord::Base

  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: /\w@\w/ }
  validates :username, presence: true, uniqueness: true

  has_many :photos, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
