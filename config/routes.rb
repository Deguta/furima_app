Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'shipping_infos', to: 'users/registrations#shipping_info'
    post 'shipping_infos', to: 'users/registrations#create_shipping_info'
  end
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
