class Admin::CommentsController < ApplicationController
  before_action :set_cmt

  def edit
  end

  def update
  end

  def destroy
    @history = current_user.histories.where(activity_type: "add_comment",
        activity_id: @comment.id).first
    if @history.nil?
      @history_other = History.where(activity_type: "add_comment", activity_id: @comment.id).first
      if @history_other.present?
        @history_other.destroy
      end
    else
      @history.destroy
    end
    @notification = Notification.where(used_send: @comment.user.id,
      user_receive: @comment.book.user.id, activity_type: "comment",
      activity_id: @comment.book.id, status: @comment.content).first
    if @notification.present?
      @notification.destroy
    end
    respond_to do |format|
      format.js
      format.html {redirect_to admin_path}
    end
  end

  private

  def comment_params
    params.require(:comment).permit :user_id, :book_id, :content
  end

  def set_cmt
    @comment = Comment.find_by(id: params[:id])
  end
end
