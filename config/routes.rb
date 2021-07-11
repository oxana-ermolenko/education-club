Rails.application.routes.draw do
  resources :rooms
  resources :events
  devise_for :users
  resources :events
  root to: "pages#home"
  resources :articles do
    resources :comments
  end
  resources :categories, except: [:destroy]
  mount ActionCable.server => '/cable'
  
  resources :messages
  resources :rooms
  resources :user_projects
  resources :projects do
    member do
      get :add
    end
    resources :tasks
  end
end
