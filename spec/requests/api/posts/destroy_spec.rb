# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'DELETE /api/posts/:id', type: :request do
  let(:url) { "/api/posts/#{post.id}" }

  let(:headers) do
    { 'Accept' => JSONAPI::MEDIA_TYPE, 'CONTENT_TYPE' => JSONAPI::MEDIA_TYPE }
  end

  let(:user) { sign_in }

  let(:post) { create(:post, user:) }

  before { post }

  it 'destroys a new post' do
    expect do
      delete(url, headers:)
      expect(response).to have_http_status(:no_content)
    end.to change(Post, :count).by(-1)
  end
end
