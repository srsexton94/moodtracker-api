# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Needs', type: :request do
  describe 'GET /needs' do
    skip 'it works!' do
      get needs_path
      expect(response).to have_http_status(200)
    end
  end
end
