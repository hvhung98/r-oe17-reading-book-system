class BooksController < ApplicationController
  before_action :set_book, only: %i(edit update destroy)

  def index
    @books = current_user.books
  end

  def new
    @book = current_user.books.build
    @categories = Category.all.map{|c| [c.name, c.id]}
    @book.chapters.new
  end

  def create
    @book = current_user.books.build(book_params)
    @book.user_id = current_user.id
    @book.category_id = params[:category_id]
    if @book.save
      params[:authors][:id].each do |author|
        if !author.empty?
          @writer = @book.writers.build(:author_id => author)
          @writer.book_id = @book.id
          @writer.save
        end
      end
      flash[:success] = "Thêm sách thành công"
      redirect_back_or home_path
    else
      render :new
    end
  end

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

  def edit
    @categories = Category.all.map{|c| [c.name, c.id]}
  end

  def update
    if @book.update(update_params)
      @book.writers.each do |writer|
        writer.destroy
      end
      params[:authors][:id].each do |author|
        if !author.empty?
          @writer = @book.writers.build(:author_id => author)
          @writer.book_id = @book.id
          @writer.save
        end
      end
      flash[:success] = "Cập nhật sách thành công";
      redirect_back_or home_path
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.js
      format.html {redirect_to home_path}
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :description, :image,
      chapters_attributes: [:id, :name, :content])
  end

  def update_params
    params.require(:book).permit(:name, :category_id, :description, :image)
  end

  def set_book
    @book = Book.find_by(id: params[:id])
    if @book.nil?
      flash[:danger] = "Book is invalid"
      redirect_to home_path
    end
  end
end
