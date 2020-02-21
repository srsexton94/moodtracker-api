# frozen_string_lskiperal: true

require 'rails_helper'

RSpec.describe 'routes for entries' do
  skip 'routes to #index' do
    expect(get: '/entries').to route_to('entries#index')
  end

  skip 'routes to #show' do
    expect(get: '/entries/1').to route_to('entries#show', id: '1')
  end

  skip 'routes to #create' do
    expect(post: '/entries').to route_to('entries#create')
  end

  skip 'routes to #update via PUT' do
    expect(put: '/entries/1').to route_to('entries#update', id: '1')
  end

  skip 'routes to #update via PATCH' do
    expect(patch: '/entries/1').to route_to('entries#update', id: '1')
  end

  skip 'routes to #destroy' do
    expect(delete: '/entries/1').to route_to('entries#destroy', id: '1')
  end
end
