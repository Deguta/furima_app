Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'shipping_infos', to: 'users/registrations#shipping_info'
    post 'shipping_infos', to: 'users/registrations#create_shipping_info'
  end

  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      delete 'delete', to: 'cards#delete'
    end
  end

  root 'items#index'
    resources :users, only: [:index, :new, :edit]
    resources :buyers, only: [:index, :create]
    resources :items, only: [:index, :new, :show, :create, :destroy, :edit, :update] do
      member do
        get 'purchase', to: 'items#purchase'
        post 'purchaser'
        get 'pay', to: 'items#pay'
        post 'pay'
      end
      collection do
        #ajaxで動くアクションのルートを設定
        get 'get_category_children', defaults: { format: 'json' }
        get 'get_category_grandchildren', defaults: { format: 'json' }
      end
    end
end