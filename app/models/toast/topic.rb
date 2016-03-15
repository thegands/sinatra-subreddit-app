class Topic < ActiveRecord::Base

  has_many :scores, as: :post
  has_many :comments
  belongs_to :user

  validates :content, :title, presence: true

  include EvalScore

  def liked?(user)
    score = self.scores.detect { |s| s.user == user }
    score.liked if score
  end

end
