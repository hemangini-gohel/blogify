class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates_presence_of :content

  default_scope { order(created_at: :desc) }
  def owned_by?(user)
    self.user == user
  end
end
