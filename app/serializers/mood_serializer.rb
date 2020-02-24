class MoodSerializer < ActiveModel::Serializer
  attributes :id, :mood, :user
end
