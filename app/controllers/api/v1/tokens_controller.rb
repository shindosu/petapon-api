class Api::V1::TokensController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        render json: {
          jwt: encode_token({id:user.id, email: user.email})
        }
      else
        render json: {errors: "Invalid email or password"}, status: :unprocessable_entity
    end
  end
  private
    def encode_token(payload={})
      exp = 24.hours.from_now
      payload[:exp] = exp.to_i
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    # For developemnt: Rails.application.secrets.secret_key_base
    # For production: ENV['SECRET_KEY_BASE']
    # For development: Rails.application.credentials.secret_key_base
    end
end