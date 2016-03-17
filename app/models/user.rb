class User < ActiveRecord::Base

  has_secure_password

  validates :name, :password, presence: true
  validates :name, uniqueness: true
  validates_format_of :name, :with => /\A[A-Za-z0-9]+\z/

  has_many :topics
  has_many :comments
  has_many :scores

  include CreatedToS

end
