Rails.application.routes.draw do
  
  devise_for :users

 
  root to: "pages#home"
  resources :articles do
    resources :comments
  end
  resources :categories, except: [:destroy]
  mount ActionCable.server => '/cable'

  get '/chat', to: 'chatrooms#index'
  
  resources :messages
  resources :user_projects
  resources :projects do
    member do
      get :add
    end
    resources :tasks
  end
end
