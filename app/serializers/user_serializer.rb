class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :image, :email, :level, :admin
end
