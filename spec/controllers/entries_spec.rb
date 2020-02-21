# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EntriesController do
  def entry_params
    {
      need_id: 1,
      mood_id: 1
    }
  end

  def entry
    Entry.first
  end

  before(:all) do
    Entry.create!(entry_params)
  end

  after(:all) do
    Entry.delete_all
  end

  describe 'GET index' do
    # Get the index method before each test
    before(:each) { get :index }

    skip 'is successful' do
      expect(response.status).to eq(200)
      # OR expect(response.status).to be_success
    end

    skip 'renders a JSON response' do
      # take the JSON response and turn it into a Ruby Object that
      # we can manipulate
      # Assign the object to `entry_collection`
      entry_collection = JSON.parse(response.body)

      # expect the collection to not be nothing
      expect(entry_collection).not_to be_nil

      # check if first entry's hunger value in collection to be equal
      # to the first entry from 'Entry.first'
      expect(entry_collection.first['need_id']).to eq(entry['need_id'])
    end
  end

  describe 'GET show' do
    # Perform a call to the show method before each test
    # Send some params (an ID) along with that call
    before(:each) { get :show, params: { id: entry.id } }

    skip 'is successful' do
      expect(response.status).to eq(200)
    end

    skip 'renders a JSON response' do
      entry_response = JSON.parse(response.body)

      # Check if the response is not nil
      expect(entry_response).not_to be_nil

      # Check if the id matches our local data
      # (could also check hunger, or any other attributes)
      expect(entry_response['id']).to eq(entry['id'])
    end
  end

  describe 'DELETE destroy' do
    # Perform a call to the destroy method before the test
    # Send the ID parameter along with that call
    before(:each) { delete :destroy, params: { id: entry.id } }

    skip 'is successful and returns an empty response' do
      expect(response).to be_successful # checks if successful
      # expect(response.status).to eq(204)
      expect(response.body).to be_empty # checks if response body is deleted
      expect(entry).to be_nil # checks if the entry is gone
    end
  end

  describe 'PATCH update' do
    def entry_diff
      { need_id: 2 }
    end

    before(:each) do
      patch :update, params: { id: entry.id, entry: entry_diff }
    end

    skip 'is successful' do
      expect(response).to be_successful # OR be_success
      # OR expect(response.status).to eq(204)
    end

    skip 'renders a JSON response' do
      entry_response = JSON.parse(response.body)

      expect(entry_response).not_to be_nil
      expect(entry['need_id']).to eq(2)
    end
  end

  describe 'POST create' do
    before(:each) do
      post :create, params: { entry: entry_params }
    end

    skip 'is successful' do
      expect(response).to be_success
    end

    skip 'renders a JSON response' do
      entry_response = JSON.parse(response.body)
      expect(entry_response).not_to be_nil
      expect(entry_response['need_id']).to eq(entry['need_id'])
    end
  end
end
