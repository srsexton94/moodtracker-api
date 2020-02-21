# frozen_string_lskiperal: true

require 'rails_helper'

RSpec.describe 'routes for needs' do
  skip 'routes to #index' do
    expect(get: '/needs').to route_to('needs#index')
  end

  skip 'routes to #show' do
    expect(get: '/needs/1').to route_to('needs#show', id: '1')
  end

  skip 'routes to #create' do
    expect(post: '/needs').to route_to('needs#create')
  end

  skip 'routes to #update via PUT' do
    expect(put: '/needs/1').to route_to('needs#update', id: '1')
  end

  skip 'routes to #update via PATCH' do
    expect(patch: '/needs/1').to route_to('needs#update', id: '1')
  end

  skip 'routes to #destroy' do
    expect(delete: '/needs/1').to route_to('needs#destroy', id: '1')
  end
end
