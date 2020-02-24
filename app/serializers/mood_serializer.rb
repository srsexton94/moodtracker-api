class MoodSerializer < ActiveModel::Serializer
  attributes :id, :mood, :created_at, :user
end
