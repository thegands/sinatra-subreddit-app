class User < ActiveRecord::Base

  has_secure_password

  validates :name, :password, presence: true
  validates :name, uniqueness: true

  has_many :topics
  has_many :comments

  include Slugify

end
