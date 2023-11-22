# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /api/comments/:id', type: :request do
  let(:url) { "/api/comments/#{comment.id}" }

  let(:comment) { create(:comment) }

  before { comment }

  it 'returns a comment' do
    get url
    expect(response).to have_http_status(:ok)

    expect(json[:data]).to be_present
  end
end
