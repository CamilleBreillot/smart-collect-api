Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :collections, only: [ :index, :show, :create, :destroy ] do
        resources :indicators, only: [ :create ]
      end
      resources :indicators, only: [ :index, :show, :create ]
      resources :fields, only: [ :index, :show, :create, :destroy ]
    end
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
