# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'POST /api/comments', type: :request do
  let(:url) do
    '/api/comments'
  end

  let(:post_params) do
    {
      data: {
        type: 'comments',
        attributes: {
          content: 'body'
        },
        relationships: {
          post: {
            data: {
              type: 'posts',
              id: post_record.id
            }
          }
        }
      }
    }
  end

  let(:headers) do
    { 'Accept' => JSONAPI::MEDIA_TYPE, 'CONTENT_TYPE' => JSONAPI::MEDIA_TYPE }
  end

  let(:post_record) do
    create(:post)
  end

  before do
    post_record
    sign_in
  end

  it 'creates a new comment' do
    expect do
      post(url, params: post_params.to_json, headers:)

      expect(response).to have_http_status(:created)
      expect(json[:data]).to be_present
    end.to change { Comment.count }.by(1)
  end
end
