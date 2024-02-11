Rails.application.routes.draw do
  resources :users, only: [:index]
  resources :questions, only: [:index]
  resources :questions, only: [:index, :create]
  resources :answers, only: [:index]
  resources :answers, only: [:create]

end