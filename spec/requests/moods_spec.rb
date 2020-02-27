require 'rails_helper'

RSpec.describe 'moods API' do
  def mood_params
    {
      mood: happy
    }
  end

  def moods
    mood.all
  end

  def mood
    mood.first
  end

  before(:all) do
    mood.create!(mood_params)
  end

  after(:all) do
    mood.delete_all
  end

  describe 'GET /moods' do
    skip 'lists all moods' do
      get '/moods'

      expect(response).to be_success

      moods_response = JSON.parse(response.body)
      expect(moods_response.length).to eq(moods.count)
      expect(moods_response.first['mood']).to eq(mood['mood'])
    end
  end

  describe 'GET /moods/:id' do
    skip 'shows one mood' do
      # Perform the feature (ie make the request)
      # get '/moods/4' # Hard-coding the ID (option #1)
      # OR use the mood getter method to get the ID of the first mood
      get "/moods/#{mood.id}"

      expect(response).to be_successful # essentially works same as be_success

      # Parse the response and store it in the `mood_response` variable
      mood_response = JSON.parse(response.body)

      # Make sure the mood has an ID
      expect(mood_response['id']).not_to be_nil

      # Make sure that the response mood's happy value is the same as the
      # `mood` getter method's happy value (which will be the first mood)
      expect(mood_response['happy']).to eq(mood['happy'])
    end
  end

  describe 'DELETE /moods/:id' do
    skip 'deletes an mood' do
      # Perform the feature
      delete "/moods/#{mood.id}"
      # Check if response was successful
      expect(response).to be_successful
      # Check if response body is not nil
      expect(response.body).not_to be_nil
      # Check if response body is empty
      expect(response.body).to be_empty
    end
  end

  describe 'PATCH /moods/:id' do
    def mood_diff
      { mood: 'calm' }
    end

    skip 'updates an mood' do
      # Perform the feature (providing mooded parameters)
      patch "/moods/#{mood.id}", params: { mood: mood_diff }
      # expect our response to be successful
      expect(response).to be_success
      # Check if response body is not nil
      expect(response.body).not_to be_nil
      # Check to see if the local mood's happy value is the same as the
      # provided mood's happy value (can also use symbols here!)
      expect(mood['mood']).to eq('calm')
    end
  end

  describe 'POST /moods' do
    def mood_diff
      { mood: 'calm' }
    end

    skip 'creates an mood' do
      post '/moods', params: { mood: mood_diff }

      expect(response).to be_success

      mood_response = JSON.parse(response.body)
      expect(mood_response).not_to be_nil
      expect(mood_response['mood']).to eq('calm')
    end
  end
end
