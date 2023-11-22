# frozen_string_literal: true

module Api
  class CommentsController < JsonApiBaseController
    before_action :require_current_user, except: %i[index show]
  end
end
