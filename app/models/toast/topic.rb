class Topic < ActiveRecord::Base

  has_many :scores, as: :post
  has_many :comments
  belongs_to :user

  validates :content, :title, presence: true

  include CreatedToS
  include Vote

  def self.new_topics
    self.order(id: :desc)
  end

  def self.top_topics
    self.new_topics.sort_by { |a| [a.score, a.id] }.reverse
    self.order("score DESC")
  end


end
