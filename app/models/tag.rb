class Tag < ApplicationRecord
  has_many :blog_tags
  has_many :blogs, through: :blog_tags
  validates :tag_name, presence: true
  validates :tag_name, uniqueness: true
end
