# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /api/posts', type: :request do
  let(:url) { '/api/posts' }

  let(:user) { create(:user) }

  let(:posts) do
    create_list(:post, 5, user:)
  end

  before { posts }

  it 'returns all posts' do
    get url
    expect(response).to have_http_status(:ok)

    expect(json[:data]).to be_present
  end
end
