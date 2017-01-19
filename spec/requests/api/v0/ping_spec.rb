require 'rails_helper'

RSpec.describe Api::V0::PingController, type: :request do
  describe 'GET /v0/ping' do
    it 'should return pong' do
      get '/api/v0/ping'
      
      expect(response.status).to eq 200
      expect(response_json['message']).to eq 'Pong'
    end
  end
end