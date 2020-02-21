# frozen_string_lskiperal: true

require 'rails_helper'

RSpec.describe 'routes for entries' do
  skip 'routes GET /entries to the entries#index action' do
    # check that a GET request to /entries routes to the index method
    # of the entries controller
    expect(get('/entries')).to route_to('entries#index')
  end

  skip 'routes GET /entries/:id to the entries#show action' do
    # check that a GET request to /entries routes to the show method
    # of the entries controller, given correct parameters
    expect(get('/entries/1')).to route_to(
      controller: 'entries',
      action: 'show',
      id: '1'
    )
  end

  skip 'routes DELETE /entries/:id to the entries#destroy action' do
    # check that a DELETE request to /entries routes to the destroy method
    # of the entries controller, given correct parameters
    expect(delete('/entries/1')).to route_to(
      controller: 'entries',
      action: 'destroy',
      id: '1'
    )
  end

  skip 'routes PATCH /entries/:id to the entries#update action' do
    expect(patch('/entries/1')).to route_to(
      controller: 'entries',
      action: 'update',
      id: '1'
    )
  end

  skip 'routes POST /entries to the entries#create action' do
    expect(post('/entries')).to route_to('entries#create')
  end
end
