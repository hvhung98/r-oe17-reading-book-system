class Admin::UsersController < ApplicationController
  before_action :set_user

  def edit
  end

  def update
    if @user.update(user_params)
      respond_to do |format|
        format.js
        format.html {redirect_to admin_path}
      end
    end
  end

  def destroy
    @book = Book.where(user_id: @user.id)
    @book.each do |book|
      book.user_id = 1
      book.save
    end
    @user.destroy
    respond_to do |format|
      format.js
      format.html {redirect_to admin_path}
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
