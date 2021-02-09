Rails.application.routes.draw do
  root to: 'tweets#index'
  resources :items, only: :index
end
