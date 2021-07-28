Rails.application.routes.draw do

  get 'sessions/new'
  devise_for :users

  root to: 'homes#top'
  get 'homes/about' => 'homes#about'
  resources :books, only: [:new, :create, :index, :show, :destroy, :update, :edit]

  resources :users, only: [:show, :edit, :update, :index]
end
