# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MoodsController do
  def mood_params
    {
      happy: true,
      calm: false,
      sad: false,
      nervous: false,
      motivated: false,
      angry: false
    }
  end

  def mood
    Mood.first
  end

  before(:all) do
    Mood.create!(mood_params)
  end

  after(:all) do
    Mood.delete_all
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
      # Assign the object to `mood_collection`
      mood_collection = JSON.parse(response.body)

      # expect the collection to not be nothing
      expect(mood_collection).not_to be_nil

      # check if first mood's hunger value in collection to be equal
      # to the first mood from 'Mood.first'
      expect(mood_collection.first['happy']).to eq(mood['happy'])
    end
  end

  describe 'GET show' do
    # Perform a call to the show method before each test
    # Send some params (an ID) along with that call
    before(:each) { get :show, params: { id: mood.id } }

    skip 'is successful' do
      expect(response.status).to eq(200)
    end

    skip 'renders a JSON response' do
      mood_response = JSON.parse(response.body)

      # Check if the response is not nil
      expect(mood_response).not_to be_nil

      # Check if the id matches our local data
      # (could also check hunger, or any other attributes)
      expect(mood_response['id']).to eq(mood['id'])
    end
  end

  describe 'DELETE destroy' do
    # Perform a call to the destroy method before the test
    # Send the ID parameter along with that call
    before(:each) { delete :destroy, params: { id: mood.id } }

    skip 'is successful and returns an empty response' do
      expect(response).to be_successful # checks if successful
      # expect(response.status).to eq(204)
      expect(response.body).to be_empty # checks if response body is deleted
      expect(mood).to be_nil # checks if the mood is gone
    end
  end

  describe 'PATCH update' do
    def mood_diff
      { happy: false }
    end

    before(:each) do
      patch :update, params: { id: mood.id, mood: mood_diff }
    end

    skip 'is successful' do
      expect(response).to be_successful # OR be_success
      # OR expect(response.status).to eq(204)
    end

    skip 'renders a JSON response' do
      mood_response = JSON.parse(response.body)

      expect(mood_response).not_to be_nil
      expect(mood['happy']).to eq(false)
    end
  end

  describe 'POST create' do
    before(:each) do
      post :create, params: { mood: mood_params }
    end

    skip 'is successful' do
      expect(response).to be_success
    end

    skip 'renders a JSON response' do
      mood_response = JSON.parse(response.body)
      expect(mood_response).not_to be_nil
      expect(mood_response['happy']).to eq(mood['happy'])
    end
  end
end
