class LikesController < ApplicationController
  before_action :set_book

  def new
    @like = Like.new
  end

  def create
    @like = current_user.likes.build
    @like_uniq = Like.find_by_user_id_and_book_id(current_user.id, @book.id)
    if @like_uniq.present?
      @like_uniq.destroy
    end
    @like.book_id = @book.id
    @like.user_id = current_user.id
    if @like.save
      respond_to do |format|
        format.js
        format.html {redirect_to @like}
      end
    else
      flash[:danger] = "Fail in like"
      redirect_to home_path
    end
  end

  def destroy
    @like = current_user.likes.find_by(book_id: params[:book_id])
    @like.destroy
    respond_to do |format|
      format.js
      format.html {redirect_to category_book_path @book.category, @book}
    end
  end

  private

  def set_book
    @book = Book.find_by(id: params[:book_id])
  end
end
