Rails.application.routes.draw do
  
  devise_for :users
  root to: "pages#home"
  resources :articles do
    resources :comments, only: [:create]
  end
  resources :categories, except: [:destroy]
  mount ActionCable.server => '/cable'

  get '/chat', to: 'chatrooms#index'
  resources :messages, only: [:create]
  resources :user_projects
  resources :projects
end
