class Comment < ApplicationRecord
  belongs_to :blog
  validates :blog_id, presence: true
  validates :commentator, presence: true
  validates :content, presence: true
end
