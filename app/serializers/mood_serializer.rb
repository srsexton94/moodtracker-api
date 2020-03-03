# frozen_string_literal: true

class MoodSerializer < ActiveModel::Serializer
  attributes :id, :mood, :created_at, :updated_at, :user
end
