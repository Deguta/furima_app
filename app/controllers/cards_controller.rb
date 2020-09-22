class CardsController < ApplicationController
  def new
  end

  # Payjpのキーを使うための記述、最後のsecret_key
  def index
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
  end

  def show
  end
end