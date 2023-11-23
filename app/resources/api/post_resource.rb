# frozen_string_literal: true

module Api
  class PostResource < ApplicationResource
    model_name 'Post'
    attributes :title, :content, :created_at, :updated_at

    has_many :comments
    has_one :user

    before_save do
      model.user = current_user if model.new_record?
    end

    before_update :authorize_user
    before_remove :authorize_user

    filter :search, apply: ->(records, value, _options) {
      term = value[0]
      return records if term.blank?
      records.search(term)
    }
  end
end
