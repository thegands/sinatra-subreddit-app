class Topic < ActiveRecord::Base

  has_many :comments
  belongs_to :user

  validates :content, :title, presence: true

end
