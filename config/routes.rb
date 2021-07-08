Rails.application.routes.draw do
  resources :events
  devise_for :users
  resources :events
  root to: "pages#home"
  resources :articles do
    resources :comments
  end
  resources :categories, except: [:destroy]

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
