Rails.application.routes.draw do
  devise_for :users
  root "articles#index"
  # define create_like action
  resources :articles, only: [:index,:new,:create] do
    member do
      get "create_like"
    end
  end
  resources :users, only: :show do
    member do
      get "follow"
    end
  end
end