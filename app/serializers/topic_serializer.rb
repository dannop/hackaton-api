class TopicSerializer < ActiveModel::Serializer
  attributes :id, :user, :category, :title, :content
end
