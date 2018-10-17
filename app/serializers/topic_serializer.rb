class TopicSerializer < ActiveModel::Serializer
  attributes :id, :user, :category, :title, :content, :like_counter, :dislike_counter
end
