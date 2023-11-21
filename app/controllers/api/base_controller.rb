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
  end
end
