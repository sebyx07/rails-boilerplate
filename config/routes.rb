# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resource :session, only: [:create, :destroy, :show]
    jsonapi_resources :posts do
      collection do
        delete '/delete_all', to: 'posts#delete_all'
      end
    end
    jsonapi_resources :users, only: %i(index show)
    jsonapi_resources :comments
  end

  get 'up' => 'rails/health#show', as: :rails_health_check

  root to: 'react#index'
  get '*path', to: 'react#index', constraints: ->(request) do
    !request.xhr? && request.format.html? && request.method == 'GET'
  end
end
