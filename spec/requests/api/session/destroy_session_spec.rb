# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'DELETE /api/session', type: :request do
  let(:url) do
    '/api/session'
  end

  it 'destroys the session' do
    delete url

    expect(response).to have_http_status(:ok)
  end
end
