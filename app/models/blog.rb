class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :blog_tags
  has_many :tags, through: :blog_tags
  validates :title, presence: true
  validates :content, presence: true
end
