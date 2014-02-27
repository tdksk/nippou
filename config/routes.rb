Nippou::Application.routes.draw do
  devise_for :users

  resources :partnerships, only: [:new, :create]
  resources :entries, except: [:show]
  resources :comments, only: [:create]

  root to: 'board#index'
end
