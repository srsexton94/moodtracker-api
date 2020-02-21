# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NeedsController do
  def need_params
    {
      hunger: 75,
      comfort: 75,
      bladder: 50,
      energy: 30,
      fun: 80,
      social: 80,
      hygiene: 60,
      environment: 70
    }
  end

  def need
    Need.first
  end

  before(:all) do
    Need.create!(need_params)
  end

  after(:all) do
    Need.delete_all
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
      # Assign the object to `need_collection`
      need_collection = JSON.parse(response.body)

      # expect the collection to not be nothing
      expect(need_collection).not_to be_nil

      # check if first need's hunger value in collection to be equal
      # to the first need from 'Need.first'
      expect(need_collection.first['hunger']).to eq(need['hunger'])
    end
  end

  describe 'GET show' do
    # Perform a call to the show method before each test
    # Send some params (an ID) along with that call
    before(:each) { get :show, params: { id: need.id } }

    skip 'is successful' do
      expect(response.status).to eq(200)
    end

    skip 'renders a JSON response' do
      need_response = JSON.parse(response.body)

      # Check if the response is not nil
      expect(need_response).not_to be_nil

      # Check if the id matches our local data
      # (could also check hunger, or any other attributes)
      expect(need_response['id']).to eq(need['id'])
    end
  end

  describe 'DELETE destroy' do
    # Perform a call to the destroy method before the test
    # Send the ID parameter along with that call
    before(:each) { delete :destroy, params: { id: need.id } }

    skip 'is successful and returns an empty response' do
      expect(response).to be_successful # checks if successful
      # expect(response.status).to eq(204)
      expect(response.body).to be_empty # checks if response body is deleted
      expect(need).to be_nil # checks if the need is gone
    end
  end

  describe 'PATCH update' do
    def need_diff
      { hunger: 90 }
    end

    before(:each) do
      patch :update, params: { id: need.id, need: need_diff }
    end

    skip 'is successful' do
      expect(response).to be_successful # OR be_success
      # OR expect(response.status).to eq(204)
    end

    skip 'renders a JSON response' do
      need_response = JSON.parse(response.body)

      expect(need_response).not_to be_nil
      expect(need['hunger']).to eq(90)
    end
  end

  describe 'POST create' do
    before(:each) do
      post :create, params: { need: need_params }
    end

    skip 'is successful' do
      expect(response).to be_success
    end

    skip 'renders a JSON response' do
      need_response = JSON.parse(response.body)
      expect(need_response).not_to be_nil
      expect(need_response['hunger']).to eq(need['hunger'])
    end
  end
end
