Rails.application.routes.draw do
  devise_for :users
  get 'users/index'

  # ルーティングの変更(デプロイ勉強会時)
  root 'items#index'
  
  resources :users, only: [:index]
end
