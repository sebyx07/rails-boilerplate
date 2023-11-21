# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'POST /api/session', type: :request do
  let(:url) do
    '/api/session'
  end
  let(:password) { SecureRandom.hex }

  let(:user) do
    create(:user, password:)
  end

  let(:params) do
    {
      session: {
        email: user.email,
        password:
      }
    }
  end

  it 'creates a session' do
    post(url, params:)

    expect(response).to have_http_status(:created)
    expect(json[:user]).to be_present
  end
end
