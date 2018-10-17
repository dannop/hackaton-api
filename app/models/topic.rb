class Topic < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :likes
  has_many :dislikes
  has_many :links
  has_many :comments
end
