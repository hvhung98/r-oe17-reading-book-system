class Admin::BooksController < ApplicationController
  before_action :set_book

  def edit
    @categories = Category.all.map{|c| [c.name, c.id]}
    @users = User.all.map{|u| [u.name, u.id]}
  end

  def update
    if @book.update(book_params)
      respond_to do |format|
        format.js
        format.html {redirect_to admin_path}
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.js
      format.html {redirect_to admin_path}
    end
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
