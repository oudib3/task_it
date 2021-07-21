Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root "home#index"

  resources :users, only: [:new, :create, :show]
  
  resources :projects, only: [:new, :create, :show] do
    resources :tasks, only: [:new, :create, :show]
  end
  
  resource :description, only: [:new, :create]
  
  resources :sessions, only: [:new, :create]
  resource :sessions, only: [:destroy]
end
