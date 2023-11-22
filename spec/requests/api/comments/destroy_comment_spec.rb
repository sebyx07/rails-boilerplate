# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'DELETE /api/comments/:id', type: :request do
  let(:url) { "/api/comments/#{comment.id}" }

  let(:headers) do
    { 'Accept' => JSONAPI::MEDIA_TYPE, 'CONTENT_TYPE' => JSONAPI::MEDIA_TYPE }
  end

  let(:user) { sign_in }

  let(:comment) { create(:comment, user:) }

  before { comment }

  it 'destroys a new comment' do
    expect do
      delete(url, headers:)
      expect(response).to have_http_status(:no_content)
    end.to change(Comment, :count).by(-1)
  end
end
