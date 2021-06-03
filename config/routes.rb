Rails.application.routes.draw do
  
  devise_for :users
  root to: "home#index"
  resources :articles do
    resources :comments, only: [:create]
  end
  resources :categories, except: [:destroy]
  mount ActionCable.server => '/cable'
end
