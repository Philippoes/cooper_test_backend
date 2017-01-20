RSpec.describe Api::V1::PerformanceDataController, type: :request do
  let(:user) { FactoryGirl.create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let(:headers) { {HTTP_ACCEPT: 'application/json'}.merge!(credentials) }

  describe 'POST /api/v1/performance_data' do
    it 'creates a data entry' do
      post '/api/v1/performance_data', params: {
          performance_data: {data: {message: 'Average'}}
      }, headers: headers

      entry = PerformanceData.last
      expect(entry.data).to eq 'message' => 'Average'
    end

    it 'gives error when user has no token' do
      post '/api/v1/performance_data', params: {
          performance_data: {data: {message: 'Average'}}
      }, headers: nil

      expect(response_json['errors']).to eq ["Authorized users only."]
      expect(response.status).to eq 401
    end

    describe 'User is not logged in' do
      let(:headers) { {HTTP_ACCEPT: 'application/json'} }
      it 'gives error when user is not logged in' do
        post '/api/v1/performance_data', params: {
            performance_data: {data: {message: 'Average'}}
        }, headers: headers

        expect(response_json['errors']).to eq ["Authorized users only."]
        expect(response.status).to eq 401
      end
    end
  end
end