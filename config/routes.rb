Rails.application.routes.draw do
  devise_for :users
  
  # ルーティングの変更(デプロイ勉強会時)
  root 'items#index'
  root 'cards#new' 

  resources :users, only: [:index]
  resources :cards, only: [:new]
end
