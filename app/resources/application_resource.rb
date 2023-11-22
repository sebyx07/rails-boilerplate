# frozen_string_literal: true

class ApplicationResource < JSONAPI::Resource
  class UnauthorizedAccess < JSONAPI::Exceptions::Error; end
  attr_reader :model

  def current_user
    context[:current_user]
  end

  def authorize_user
    return if model.user == current_user

    raise JSONAPI::Exceptions::UnauthorizedAccess
  end
end
