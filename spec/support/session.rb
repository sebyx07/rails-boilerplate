# frozen_string_literal: true

module SessionHelper
  def sign_in(user = create(:user))
    allow_any_instance_of(Api::BaseController).to receive(:current_user).and_return(user)

    user
  end
end

RSpec.configure do |config|
  config.include SessionHelper, type: :request
end
