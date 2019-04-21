class Admin::CommentsController < ApplicationController
  before_action :set_cmt

  def edit
    @users = User.all.map{|u| [u.name, u.id]}
    @books = Book.all.map{|b| [b.name, b.id]}
  end

  def update
    if @comment.update(comment_params)
      respond_to do |format|
        format.js
        format.html {redirect_to admin_path}
      end
    end
  end

  def destroy
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
