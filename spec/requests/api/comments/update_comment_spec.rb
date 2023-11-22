# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PUT /api/comments/:id', type: :request do
  let(:url) { "/api/comments/#{comment.id}" }

  let(:post_params) do
    {
      data: {
        type: 'comments',
        id: comment.id,
        attributes: {
          content: 'body'
        }
      }
    }
  end

  let(:headers) do
    { 'Accept' => JSONAPI::MEDIA_TYPE, 'CONTENT_TYPE' => JSONAPI::MEDIA_TYPE }
  end

  let(:user) { sign_in }

  let(:comment) { create(:comment, user:) }

  before { comment }

  it 'updates a comment' do
    expect do
      put(url, params: post_params.to_json, headers:)

      expect(response).to have_http_status(:ok)
      expect(json[:data]).to be_present
    end.to change { comment.reload.content }.from(comment.content).to('body')
  end
end
