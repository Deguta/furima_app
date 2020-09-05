Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'shipping_infos', to: 'users/registrations#shipping_info'
    post 'shipping_infos', to: 'users/registrations#create_shipping_info'
  end
  root 'items#index'
  resources :users, only: [:index]
  resources :items, only: [:new]

end
