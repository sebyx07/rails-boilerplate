# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PUT /api/posts/:id', type: :request do
  let(:url) { "/api/posts/#{post.id}" }

  let(:post_params) do
    {
      data: {
        type: 'posts',
        id: post.id,
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

  let(:user) { sign_in }

  let(:post) { create(:post, user:) }

  before { post }

  it 'updates a post' do
    expect do
      put(url, params: post_params.to_json, headers:)

      expect(response).to have_http_status(:ok)
      expect(json[:data]).to be_present
    end.to change { post.reload.title }.from(post.title).to('title')
      .and change { post.reload.content }.from(post.content).to('body')
  end
end
