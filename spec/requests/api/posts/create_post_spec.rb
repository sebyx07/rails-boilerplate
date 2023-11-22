# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'POST /api/posts', type: :request do
  let(:url) do
    '/api/posts'
  end

  let(:post_params) do
    {
      data: {
        type: 'posts',
        attributes: {
          title: 'title',
          content: 'body'
        }
      }
    }
  end

  let(:headers) do
    { 'Accept' => JSONAPI::MEDIA_TYPE, 'CONTENT_TYPE' => JSONAPI::MEDIA_TYPE }
  end

  before do
    sign_in
  end

  it 'creates a new post' do
    expect do
      post(url, params: post_params.to_json, headers:)

      expect(response).to have_http_status(:created)
    end.to change { Post.count }.by(1)
  end
end
