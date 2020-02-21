# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'needs API' do
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

  def needs
    need.all
  end

  def need
    need.first
  end

  before(:all) do
    need.create!(need_params)
  end

  after(:all) do
    need.delete_all
  end

  describe 'GET /needs' do
    skip 'lists all needs' do
      get '/needs'

      expect(response).to be_success

      needs_response = JSON.parse(response.body)
      expect(needs_response.length).to eq(needs.count)
      expect(needs_response.first['hunger']).to eq(need['hunger'])
    end
  end

  describe 'GET /needs/:id' do
    skip 'shows one need' do
      # Perform the feature (ie make the request)
      # get '/needs/4' # Hard-coding the ID (option #1)
      # OR use the need getter method to get the ID of the first need
      get "/needs/#{need.id}"

      expect(response).to be_successful # essentially works same as be_success

      # Parse the response and store it in the `need_response` variable
      need_response = JSON.parse(response.body)

      # Make sure the need has an ID
      expect(need_response['id']).not_to be_nil

      # Make sure that the response need's hunger value is the same as the
      # `need` getter method's hunger value (which will be the first need)
      expect(need_response['hunger']).to eq(need['hunger'])
    end
  end

  describe 'DELETE /needs/:id' do
    skip 'deletes an need' do
      # Perform the feature
      delete "/needs/#{need.id}"
      # Check if response was successful
      expect(response).to be_successful
      # Check if response body is not nil
      expect(response.body).not_to be_nil
      # Check if response body is empty
      expect(response.body).to be_empty
    end
  end

  describe 'PATCH /needs/:id' do
    def need_diff
      { hunger: 90 }
    end

    skip 'updates an need' do
      # Perform the feature (providing needed parameters)
      patch "/needs/#{need.id}", params: { need: need_diff }
      # expect our response to be successful
      expect(response).to be_success
      # Check if response body is not nil
      expect(response.body).not_to be_nil
      # Check to see if the local need's hunger value is the same as the
      # provided need's hunger value (can also use symbols here!)
      expect(need['hunger']).to eq(90)
    end
  end

  describe 'POST /needs' do
    def need_diff
      { hunger: 90 }
    end

    skip 'creates an need' do
      post '/needs', params: { need: need_diff }

      expect(response).to be_success

      need_response = JSON.parse(response.body)
      expect(need_response).not_to be_nil
      expect(need_response['hunger']).to eq(90)
    end
  end
end
