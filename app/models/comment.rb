class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  has_many :comment_comments
end
