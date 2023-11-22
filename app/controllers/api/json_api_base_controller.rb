# frozen_string_literal: true

module Api
  class JsonApiBaseController < Api::BaseController
    include JSONAPI::ActsAsResourceController

    def context
      { current_user: }
    end
  end
end
