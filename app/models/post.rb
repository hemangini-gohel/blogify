class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates_presence_of :title, :content

  def owned_by?(user)
    self.user == user
  end
end
