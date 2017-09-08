# frozen_string_literal: true

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# See http://andrewberls.com/blog/post/api-versioning-with-rails-4

Rails.application.routes.draw do

  root to: 'application#index' # This action intentionally doesn't exist to disable WelcomeController#index and force a JSON 404 response

  resources :users, only: %i[index create show update destroy] do
    resources :comments, only: %i[index]
  end

  resources :comments, only: %i[create show update destroy]

  resources :auth, only: %i[create]
  get "/docs", to: "docs#index"
end
