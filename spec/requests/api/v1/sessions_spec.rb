RSpec.describe 'Sessions', type: :request do
  let(:user) { FactoryGirl.create(:user) }
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }

  describe 'POST /api/v1/auth/sign_in' do
    it 'valid credentials returns user' do
      post '/api/v1/auth/sign_in', params: {
          email: user.email,
          password: user.password
      }, headers: headers

      expected_response = {
          'data' => {
              'id' => user.id,
              'uid' => user.email,
              'email' => user.email,
              'provider' => 'email',
              'name' => nil,
              'nickname' => nil,
              'image' => nil
          }
      }

      expect(response_json).to eq expected_response
      expect(response.status).to eq 200
    end
  end
end