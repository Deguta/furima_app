class UsersController < ApplicationController

  def index

  end

  def edit

  end

  def new
    @user = User.new
  end
end
