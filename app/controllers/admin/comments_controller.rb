class Admin::CommentsController < ApplicationController
  before_action :set_cmt

  def edit
    @users = User.all.map{|u| [u.name, u.id]}
    @books = Book.all.map{|b| [b.name, b.id]}
  end

  def update
    if @comment.update(comment_params)
      @history_edit = current_user.histories.where(activity_type: "edit_comment",
        activity_id: @comment.id).first
      if @history_edit.present?
        @history_edit.destroy
        @history = current_user.histories.build(activity_type: "edit_comment",
          activity_id: @comment.id)
        @history.save
      else
        @history = current_user.histories.build(activity_type: "edit_comment",
          activity_id: @comment.id)
        @history.save
      end
      respond_to do |format|
        format.js
        format.html {redirect_to admin_path}
      end
    end
  end

  def destroy
    @history = current_user.histories.where(activity_type: "add_comment",
        activity_id: @comment.id).first
    @history_edit = History.where(activity_type: "edit_comment", activity_id: @comment.id)
    @history_edit.each do |history|
      history.destroy
    end
    if @history.nil?
      @history_add = History.where(activity_type: "add_comment",
        activity_id: @comment.id).first.destroy
      @history_delete = current_user.histories.build(activity_type: "delete_comment", activity_id: @comment.user_id)
      @history_delete.save
    else
      @history.destroy
    end
    @comment.destroy
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
