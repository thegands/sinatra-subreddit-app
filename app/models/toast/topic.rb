class Topic < ActiveRecord::Base

  has_many :scores, as: :post
  has_many :comments
  belongs_to :user

  validates :content, :title, presence: true

  include EvalScore

end
