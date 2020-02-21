class MoodSerializer < ActiveModel::Serializer
  attributes :id, :happy, :calm, :sad, :nervous, :energetic, :angry
end
