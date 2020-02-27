# frozen_string_literal: true

class Mood < ApplicationRecord
  belongs_to :user
  has_many :needs
end
