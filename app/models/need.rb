# frozen_string_literal: true

class Need < ApplicationRecord
  belongs_to :mood
  has_one :user, through: :mood
end
