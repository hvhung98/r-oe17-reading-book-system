class UsersController < ApplicationController
  before_action :set_user, only: %i(show)
  before_action :logged_in_user, only: %i(show)

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to new_user_follow_path(@user)
    else
      render :new
    end
  end

  def show
    store_location
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
    if @user.nil?
      flash[:danger] = t("invalid_user")
      redirect_to root_url
    end
  end

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in"
      redirect_to root_url
    end
  end
end
