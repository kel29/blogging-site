class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :blog_tags
  has_many :tags, through: :blog_tags
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :content, presence: true

  def like_post
    self.likes += 1
    save
  end

  def self.featured_blog
    order('likes DESC')
  end

  def self.most_recent
    order('created_at DESC')
  end

end
