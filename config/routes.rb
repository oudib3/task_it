Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"

  resources :users, only: [:new, :create, :show]
  
<<<<<<< HEAD
  resources :projects, only: [:new, :create, :show] do
    resources :tasks, only: [:new, :create]
  end 
=======

  resources :projects, only: [:new, :create, :show] do
    resources :tasks, only: [:new, :create]
  end 

>>>>>>> 8bd2ef73ff1e50c5579fabf0b3932f0b31c443d7
  
  resources :sessions, only: [:new, :create]
  resource :sessions, only: [:destroy]
end
