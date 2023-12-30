class Users::RegistrationsController < Devise::RegistrationsController
  include TokenGeneration
  respond_to :json

  def create
    super do |user|
      if user.persisted?
        user.update(token: generate_token(user))
        render_json_response(user) and return
      end
    end
  end

  private

  def render_json_response(user)
    render json: { user: user, token: user.token }, status: :created
  end
end
