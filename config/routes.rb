# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resource :session, only: [:create, :destroy, :show]
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
