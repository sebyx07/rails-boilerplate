# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /api/posts/:id', type: :request do
  let(:url) { "/api/posts/#{post.id}" }

  let(:post) { create(:post) }

  before { post }

  it 'returns a post' do
    get url
    expect(response).to have_http_status(:ok)

    expect(json[:data]).to be_present
  end
end
