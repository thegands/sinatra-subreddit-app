class Topic < ActiveRecord::Base

  has_many :scores, as: :post
  has_many :comments
  belongs_to :user

  validates :content, :title, presence: true

  include EvalScore
  include CreatedToS

  def liked?(user)
    if score = Score.find_by(user: user, post: self)
      score.liked
    end
  end

  def self.top_topics
    self.all.sort { |a,b| b.score <=> a.score }
  end

  def self.new_topics
    self.all.reverse
  end


end
