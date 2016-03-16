class Topic < ActiveRecord::Base

  has_many :scores, as: :post
  has_many :comments
  belongs_to :user

  validates :content, :title, presence: true

  include EvalScore

  def liked?(user)
    score = self.scores.detect { |s| s.user == user }
    score ? score.liked : nil
  end

  def self.top_topics
    self.all.sort { |a,b| b.score <=> a.score }
  end

  def self.new_topics
    self.all.reverse
  end


end
