# frozen_string_literal: true

module Api
  class UserResource < ApplicationResource
    model_name 'User'
    attributes :email, :created_at

    has_many :comments
    has_many :posts
  end
end
