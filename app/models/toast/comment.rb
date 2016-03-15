class Comment < ActiveRecord::Base

  has_many :scores, as: :post
  belongs_to :topic
  belongs_to :user

  validates :content, presence: true

  include EvalScore

end
