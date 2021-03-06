# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:encrypted_password]
    @shipping_info = @user.shipping_infos.build
    render :shipping_info
  end

  def create_shipping_info
    @user = User.new(session["devise.regist_data"]["user"])
    @shipping_info = ShippingInfo.new(shipping_info_params)
    unless @shipping_info.valid?
      flash.now[:alert] = @shipping_info.errors.full_messages
      render :shipping_info and return
    end
    # @user.build_shipping_info(@shipping_info.attributes)
    @user.shipping_infos.build(@shipping_info.attributes)
    @user.save
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
    redirect_to root_path
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def shipping_info_params
    params.require(:shipping_info).permit(:family_name, :family_name_kana, :first_name, :first_name_kana, :postal_code, :prefecture_id, :city, :address, :building, :phone_number)
  end

end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end