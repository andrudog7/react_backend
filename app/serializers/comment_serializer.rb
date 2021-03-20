class CommentSerializer < ActiveModel::Serializer
    attributes :username, :text, :created_at
end