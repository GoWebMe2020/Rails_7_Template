require 'rails_helper'

RSpec.describe 'Registrations', type: :request do
  describe 'POST /users' do
    it 'registers a new user' do
      expect {
        post user_registration_path, params: {
          user: {
            email: 'test@example.com',
            password: 'password',
            password_confirmation: 'password'
          }
        }
      }.to change(User, :count).by(1)

      expect(response).to have_http_status(:created)
      expect(response.body).to include('token')
    end

    # Add more tests for invalid scenarios...
  end
end
