Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'shipping_infos', to: 'users/registrations#shipping_info'
    post 'shipping_infos', to: 'users/registrations#create_shipping_info'
  end

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  root 'items#index'
    resources :users, only: [:index, :edit, :destroy]
    resources :cards, only: [:new]
    resources :items, only: [:index, :show] do
      resources :comments, only: [:create ,:update, :destroy]
    end

end