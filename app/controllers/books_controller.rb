class BooksController < ApplicationController
  before_action :set_book, only: %i(edit update destroy)

  def index
    @books = Book.where(user_id: current_user.id)
    store_location
  end

  def new
    @book = current_user.books.build
    @categories = Category.all.map{|c| [c.name, c.id]}
    @book.chapters.new
  end

  def create
    @book = current_user.books.build(book_params)
    @book.user_id = current_user.id
    if current_user.role_id == 2 || current_user.role_id == 3
      @book.status = true
    end
    @book.category_id = params[:category_id]
    if @book.save
      @history = current_user.histories.build(activity_type: "add_book",
        activity_id: @book.id)
      @history.save
      params[:authors][:id].each do |author|
        if !author.empty?
          @writer = @book.writers.build(:author_id => author)
          @writer.book_id = @book.id
          @writer.save
        end
      end
      flash[:success] = "Thêm sách thành công"
      redirect_to [@book.category, @book]
    else
      render :new
    end
  end

  def show
    @category = Category.find_by(id: params[:category_id])
    @book = @category.books.find_by(id: params[:id])
    if (@book.status) || (!@book.status && (current_user.id == @book.user_id)) ||
      (!@book.status && (current_user.role_id == 2 || current_user.role_id == 3))
      @count_like = @book.likes.count
      @feed_authors = @book.authors
      @user = @book.user
      @feed_chapters = @book.chapters
      @categories = Category.all
      @feed_comments = @book.comments.order_by_time
      store_location
    else
      redirect_back_or home_path
    end
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
    History.where(activity_type: "add_chapter").each do |add_chapter|
      add_chapter.destroy
    end
    History.where(activity_type: "add_comment").each do |add_comment|
      add_comment.destroy
    end
    History.where(activity_type: "like").each do |like|
      like.destroy
    end
    Notification.where(activity_type: "add_chapter").each do |add_chapter|
      add_chapter.destroy
    end
    Notification.where(activity_type: "edit_chapter").each do |edit_chapter|
      edit_chapter.destroy
    end
    Notification.where(activity_type: "delete_chapter").each do |delete_chapter|
      delete_chapter.destroy
    end
    Notification.where(activity_type: "comment").each do |comment|
      comment.destroy
    end
    Notification.where(activity_type: "like").each do |like|
      like.destroy
    end
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
