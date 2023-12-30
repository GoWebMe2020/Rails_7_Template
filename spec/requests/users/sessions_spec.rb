# spec/requests/sessions_spec.rb
require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  let!(:user) { create(:user) }

  describe 'POST /users/sign_in' do
    it 'signs in the user' do
      post user_session_path, params: {
        user: {
          email: user.email,
          password: user.password
        }
      }

      expect(response).to have_http_status(:created)
      expect(response.body).to include('token')
    end

    # Add more tests for invalid sign-in...
  end

  describe 'DELETE /users/sign_out' do
    before do
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      token = JSON.parse(response.body)['token']
      @headers = { 'Authorization': "Bearer #{token}" }
    end

    it 'signs out the user' do
      delete destroy_user_session_path, headers: @headers

      expect(response).to have_http_status(:no_content)
    end

    # Add more tests for invalid or expired token...
  end
end
