# frozen_string_literal: true

module Api
  class CommentResource < ApplicationResource
    model_name 'Comment'
    attributes :content, :created_at, :updated_at

    has_one :user
    has_one :post

    before_save do
      model.user = current_user if model.new_record?
    end

    before_update :authorize_user
    before_remove :authorize_user
  end
end
