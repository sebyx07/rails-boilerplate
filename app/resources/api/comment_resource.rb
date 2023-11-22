# frozen_string_literal: true

module Api
  class CommentResource < ApplicationResource
    model_name 'Comment'
    attributes :content, :created_at, :updated_at

    has_one :user
    has_one :post
  end
end
