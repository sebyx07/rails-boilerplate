# frozen_string_literal: true

module Api
  class SessionsController < BaseController
    def create
      @user = User.find_by(email: create_params[:email])
      if @user&.valid_password?(create_params[:password])
        request.env['warden'].set_user(@user)
        render :show, status: :created
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end

    def destroy
      request.env['warden'].logout
      head :ok
    end

    def show
      @user = current_user
    end

    private
      def create_params
        params.require(:session).permit(:email, :password)
      end
  end
end
