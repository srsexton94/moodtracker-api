# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Moods', type: :request do
  describe 'GET /moods' do
    skip 'it works!' do
      get moods_path
      expect(response).to have_http_status(200)
    end
  end
end