class CommentsController < ApplicationController
  before_action :set_book
  def new
    @comment = @book.comments.build
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @category = Category.find_by(id: params[:category_id])
    @comment.book_id = @book.id
    @comment.user_id = current_user.id
    if @comment.save
      @history = current_user.histories.build(activity_type: "add_comment",
        activity_id: @comment.id)
      @history.save
      if current_user.id != @book.user.id
        @notification = Notification.new(used_send: current_user.id,
          user_receive: @book.user.id, activity_type: "comment",
          activity_id: @book.id, status: @comment.content)
        @notification.save
      end
      respond_to do |format|
        format.js
        format.html {redirect_to category_book_path @category, @book}
      end
    else
      flash[:danger] = "Error in adding comment"
      redirect to category_book_path @category, @book
    end
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_book
    @book = Book.find_by(id: params[:book_id])
  end
end
