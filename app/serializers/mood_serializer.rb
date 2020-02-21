class MoodSerializer < ActiveModel::Serializer
  attributes :id, :happy, :calm, :sad, :nervous, :motivated, :angry
end
