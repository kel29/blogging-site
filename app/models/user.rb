class User < ApplicationRecord
  has_many :blogs
  validates :name, presence: true
end
