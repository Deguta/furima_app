Rails.application.routes.draw do
  get 'users/index'
  # ルーティングの変更(デプロイ勉強会時)
  root 'items#index'
end
