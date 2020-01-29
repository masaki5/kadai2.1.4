Rails.application.routes.draw do
  devise_for :users

  resources :users ,only: [:show,:index,:edit,:update] do
    member do
      get :following, :followers
     end
   end
  resources :relations, only: [:create, :destroy]
  resources :books do
  #まずはルーティングを設定するfavoritesキャリ
  resources :favorites, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
end
   get 'searchs/search'

  root 'home#top'
  get 'home/about'

end