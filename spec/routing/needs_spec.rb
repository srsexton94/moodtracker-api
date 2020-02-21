# frozen_string_lskiperal: true

require 'rails_helper'

RSpec.describe 'routes for needs' do
  skip 'routes GET /needs to the needs#index action' do
    # check that a GET request to /needs routes to the index method
    # of the needs controller
    expect(get('/needs')).to route_to('needs#index')
  end

  skip 'routes GET /needs/:id to the needs#show action' do
    # check that a GET request to /needs routes to the show method
    # of the needs controller, given correct parameters
    expect(get('/needs/1')).to route_to(
      controller: 'needs',
      action: 'show',
      id: '1'
    )
  end

  skip 'routes DELETE /needs/:id to the needs#destroy action' do
    # check that a DELETE request to /needs routes to the destroy method
    # of the needs controller, given correct parameters
    expect(delete('/needs/1')).to route_to(
      controller: 'needs',
      action: 'destroy',
      id: '1'
    )
  end

  skip 'routes PATCH /needs/:id to the needs#update action' do
    expect(patch('/needs/1')).to route_to(
      controller: 'needs',
      action: 'update',
      id: '1'
    )
  end

  skip 'routes POST /needs to the needs#create action' do
    expect(post('/needs')).to route_to('needs#create')
  end
end
