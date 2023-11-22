# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'POST /api/posts/delete_all', type: :request do
  let(:url) { '/api/posts/delete_all' }

  let(:user) { sign_in }

  let(:posts) do
    create_list(:post, 5, user:)
  end

  before { posts }

  it 'deletes all user posts' do
    delete url
    expect(response).to have_http_status(:no_content)
  end
end
