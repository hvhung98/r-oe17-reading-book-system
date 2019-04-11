class BooksController < ApplicationController
  def show
    @category = Category.find_by(id: params[:category_id])
    @book = @category.books.find_by(id: params[:id])
    @count_like = @book.likes.count
    @feed_authors = @book.authors
    @user = @book.user
    @feed_chapters = @book.chapters
    @categories = Category.all
    @feed_comments = @book.comments.order created_at: :desc
    store_location
  end
end
