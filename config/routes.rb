Rails.application.routes.draw do
  # devise_for :users　#rails sでエラーが出るためコメントアウト
  
  # ルーティングの変更(デプロイ勉強会時)
  root 'items#index'
  # root to:"items#index"でもOK
  # 最初のトップページである。因みに#indexを#newに書き換えるとnewページになる
  
  resources :users, only: [:index]
  # usersはusers_controllerを橋渡ししている。 [:index]はアクションコントローラーの処理名
  # resouucesとコントローラー名前を増やす事により表示させるページを増やす事ができる


  resources :items, only: [:new]
  # itemsはitems_controllerを橋渡ししている。 [:new]はアクションコントローラーの処理名
  # 商品を新規登録するため[:new]を使用する

end
