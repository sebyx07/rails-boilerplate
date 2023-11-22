# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /api/comments', type: :request do
  let(:url) { '/api/comments' }

  let(:user) { create(:user) }

  let(:comments) do
    create_list(:comment, 5, user:)
  end

  before { comments }

  it 'returns all comments' do
    get url
    expect(response).to have_http_status(:ok)

    expect(json[:data]).to be_present
  end
end
