class Comment < ApplicationRecord
  belongs_to :blog
  validates :blog_id, presence: true
  validates :commentator, presence: true
  validates :commentator, uniqueness: true
  validates :content, presence: true
end
