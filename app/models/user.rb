class User < ApplicationRecord
    has_many :user_achs
	has_many :comment_comments
	has_many :topics
	has_many :likes
	has_many :dislikes
	has_many :comments

	mount_base64_uploader :image, ImageUploader

end
