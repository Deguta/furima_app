class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :confirmation_pass, :family_name, :family_name_kana, :first_name, :first_name_kana, :birth_day])
  end

  # basic認証に必要な記述
  before_action :basic_auth, if: :production?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

  # if: :production?を追加
  before_action :basic_auth, if: :production?

  def production?
    Rails.env.production?
  end
  
end
