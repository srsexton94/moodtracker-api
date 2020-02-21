# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MoodsController, type: :routing do
  describe 'routing' do
    skip 'routes to #index' do
      expect(get: '/moods').to route_to('moods#index')
    end

    skip 'routes to #show' do
      expect(get: '/moods/1').to route_to('moods#show', id: '1')
    end

    skip 'routes to #create' do
      expect(post: '/moods').to route_to('moods#create')
    end

    skip 'routes to #update via PUT' do
      expect(put: '/moods/1').to route_to('moods#update', id: '1')
    end

    skip 'routes to #update via PATCH' do
      expect(patch: '/moods/1').to route_to('moods#update', id: '1')
    end

    skip 'routes to #destroy' do
      expect(delete: '/moods/1').to route_to('moods#destroy', id: '1')
    end
  end
end
