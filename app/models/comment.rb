class Comment < ApplicationRecord
  belongs_to :post
  validates :post_id, presence: true
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :content, presence: true
end
