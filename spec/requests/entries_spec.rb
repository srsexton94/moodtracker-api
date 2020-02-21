# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'entries API' do
  def entry_params
    {
      need_id: 1,
      mood_id: 1
    }
  end

  def entries
    entry.all
  end

  def entry
    entry.first
  end

  before(:all) do
    entry.create!(entry_params)
  end

  after(:all) do
    entry.delete_all
  end

  describe 'GET /entries' do
    skip 'lists all entries' do
      get '/entries'

      expect(response).to be_success

      entries_response = JSON.parse(response.body)
      expect(entries_response.length).to eq(entries.count)
      expect(entries_response.first['need_id']).to eq(entry['need_id'])
    end
  end

  describe 'GET /entries/:id' do
    skip 'shows one entry' do
      # Perform the feature (ie make the request)
      # get '/entries/4' # Hard-coding the ID (option #1)
      # OR use the entry getter method to get the ID of the first entry
      get "/entries/#{entry.id}"

      expect(response).to be_successful # essentially works same as be_success

      # Parse the response and store it in the `entry_response` variable
      entry_response = JSON.parse(response.body)

      # Make sure the entry has an ID
      expect(entry_response['id']).not_to be_nil

      # Make sure that the response entry's need_id is the same as the
      # `entry` getter method's need_id (which will be the first entry)
      expect(entry_response['need_id']).to eq(entry['need_id'])
    end
  end

  describe 'DELETE /entries/:id' do
    skip 'deletes an entry' do
      # Perform the feature
      delete "/entries/#{entry.id}"
      # Check if response was successful
      expect(response).to be_successful
      # Check if response body is not nil
      expect(response.body).not_to be_nil
      # Check if response body is empty
      expect(response.body).to be_empty
    end
  end

  describe 'PATCH /entries/:id' do
    def entry_diff
      { need_id: 2 }
    end

    skip 'updates an entry' do
      # Perform the feature (providing entryed parameters)
      patch "/entries/#{entry.id}", params: { entry: entry_diff }
      # expect our response to be successful
      expect(response).to be_success
      # Check if response body is not nil
      expect(response.body).not_to be_nil
      # Check to see if the local entry's need_id is the same as the
      # provided entry's need_id (can also use symbols here!)
      expect(entry['need_id']).to eq(2)
    end
  end

  describe 'POST /entries' do
    def entry_diff
      { need_id: 2 }
    end

    skip 'creates an entry' do
      post '/entries', params: { entry: entry_diff }

      expect(response).to be_success

      entry_response = JSON.parse(response.body)
      expect(entry_response).not_to be_nil
      expect(entry_response['need_id']).to eq(2)
    end
  end
end
