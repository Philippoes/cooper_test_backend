RSpec.describe 'User Registration', type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }

  context 'with valid credentials' do
    it 'returns a user and token' do
      post '/api/v1/auth', params: {
          email: 'example@craftacademy.se',
          password: 'password',
          password_confirmation: 'password'
      }, headers: headers

      expect(response_json['status']).to eq 'success'
      expect(response.status).to eq 200
    end
  end

  context 'returns an error message when user submits' do
    it 'non-matching password confirmation' do
      post '/api/v1/auth', params: {
          email: 'example@craftacademy.se',
          password: 'password',
          password_confirmation: 'password_not_right'
      }, headers: headers
    end
  end
end