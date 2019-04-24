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
      @history = current_user.histories.build(activity_type: "like",
        activity_id: @like.id)
      @history.save
      if @book.user.id != current_user.id
        @notification = Notification.new(used_send: current_user.id,
          user_receive: @book.user.id, activity_type: "like", activity_id: @book.id)
        @notification.save
      end
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
    current_user.histories.where(activity_type: "like", activity_id: @like.id).first.destroy
    @like.destroy
    if current_user.id != @book.user.id
      Notification.where(used_send: current_user.id,
        user_receive: @book.user.id, activity_type: "like",
        activity_id: @book.id).first.destroy
    end
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
