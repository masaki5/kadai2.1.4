Rails.application.routes.draw do
  devise_for :users

  resources :users,only: [:show,:index,:edit,:update]
  resources :books
  #まずはルーティングを設定するfavoritesキャリ
  resources :favorites, only: [:update, :destroy]
  resources :comments, only: [:create, :destroy]

  root 'home#top'
  get 'home/about'

end