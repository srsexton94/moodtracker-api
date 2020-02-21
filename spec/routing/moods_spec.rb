# frozen_string_lskiperal: true

require 'rails_helper'

RSpec.describe 'routes for moods' do
  skip 'routes GET /moods to the moods#index action' do
    # check that a GET request to /moods routes to the index method
    # of the moods controller
    expect(get('/moods')).to route_to('moods#index')
  end

  skip 'routes GET /moods/:id to the moods#show action' do
    # check that a GET request to /moods routes to the show method
    # of the moods controller, given correct parameters
    expect(get('/moods/1')).to route_to(
      controller: 'moods',
      action: 'show',
      id: '1'
    )
  end

  skip 'routes DELETE /moods/:id to the moods#destroy action' do
    # check that a DELETE request to /moods routes to the destroy method
    # of the moods controller, given correct parameters
    expect(delete('/moods/1')).to route_to(
      controller: 'moods',
      action: 'destroy',
      id: '1'
    )
  end

  skip 'routes PATCH /moods/:id to the moods#update action' do
    expect(patch('/moods/1')).to route_to(
      controller: 'moods',
      action: 'update',
      id: '1'
    )
  end

  skip 'routes POST /moods to the moods#create action' do
    expect(post('/moods')).to route_to('moods#create')
  end
end
