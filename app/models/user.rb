class User < ActiveRecord::Base

  has_secure_password

  has_many :topics
  has_many :comments, through: :topics

  validates :username, :password, presence: true
  validates :username, uniqueness: true

  include Slugify

end
