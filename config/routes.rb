Rails.application.routes.draw do
  # カスタムpathの生成
  devise_scope :user do
    get "/sign_in" => "devise/sessions#new" # login/sign_inへのカスタムパス
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # sign_up/registrationへのカスタムパス
  end
  
  devise_for :users 
  root 'items#index'
    resources :users, only: [:index]
end
