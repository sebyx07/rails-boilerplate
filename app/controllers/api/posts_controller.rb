# frozen_string_literal: true

module Api
  class PostsController < JsonApiBaseController
    before_action :require_current_user, except: %i[index show]

    def delete_all
      current_user.posts.destroy_all
      head :no_content
    end
  end
end
