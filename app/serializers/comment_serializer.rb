class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user, :topic, :content
end
