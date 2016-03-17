class Score < ActiveRecord::Base

  belongs_to :user
  belongs_to :post, polymorphic: true

  validates_uniqueness_of :user, scope: [:post_id, :post_type]

end
