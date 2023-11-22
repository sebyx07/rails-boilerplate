# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /api/session', type: :request do
  let(:url) do
    '/api/session'
  end

  let(:password) { SecureRandom.hex }

  let(:user) do
    create(:user, password:)
  end

  before do
    post url, params: {
      session: {
        email: user.email,
        password:
      }
    }
  end

  it 'returns the session' do
    get url
    expect(response).to have_http_status(:ok)
    expect(json[:user]).to be_present
  end
end
