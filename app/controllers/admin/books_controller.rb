class Admin::BooksController < ApplicationController
  before_action :set_book

  def edit
    if @book.status
      @book.status = false
      @book.save
    else
      @book.status = true
      @book.save
    end
    respond_to do |format|
      format.js
      format.html
    end
  end

  def update
    @notification = Notification.where(used_send: current_user.id, activity_id: @book.id).first
    if @notification.present?
      @notification.destroy
      respond_to do |format|
        format.js
        format.html {redirect_to admin_path}
      end
    else
      @notification = Notification.new(used_send: current_user.id,
        user_receive: @book.user.id, activity_type: "delete_book", activity_id: @book.id)
      @notification.save
      respond_to do |format|
        format.js
        format.html {redirect_to admin_path}
      end
    end
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit :name, :category_id, :user_id, :description,
      :status, :image
  end

  def set_book
    @book = Book.find_by(id: params[:id])
  end
end
