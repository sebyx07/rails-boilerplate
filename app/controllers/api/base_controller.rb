# frozen_string_literal: true

module Api
  class BaseController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound do |e|
      not_found(e)
    end

    private
      def not_found(e)
        render json: { error: e.message }, status: :not_found
      end

      def current_user
        return @current_user if defined? @current_user
        user_id = warden.authenticate.try(:[], 'id')
        return @current_user = nil if user_id.blank?
        @current_user = User.find(user_id)
      end
  end
end
