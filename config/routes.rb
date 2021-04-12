Rails.application.routes.draw do
  root 'questions#index'
  devise_for :users

  resources :questions, only: [:index, :new, :create]
  
  resources :questions, only: [:show] do
    resources :answers, only: [:index, :new, :create]
  end
  resources :answers, only: [:show]
end
