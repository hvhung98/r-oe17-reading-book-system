class Admin::BooksController < ApplicationController
  before_action :set_book

  def edit
    @categories = Category.all.map{|c| [c.name, c.id]}
    @users = User.all.map{|u| [u.name, u.id]}
  end

  def update
    if @book.update(book_params)
      @history_edit = current_user.histories.where(activity_type: "edit_book",
        activity_id: @book.id).first
      if @history_edit.present?
        @history_edit.destroy
        @history = current_user.histories.build(activity_type: "edit_book",
          activity_id: @book.id)
        @history.save
      else
        @history = current_user.histories.build(activity_type: "edit_book",
          activity_id: @book.id)
        @history.save
      end
      respond_to do |format|
        format.js
        format.html {redirect_to admin_path}
      end
    end
  end

  def destroy
    @history = current_user.histories.where(activity_type: "add_book",
      activity_id: @book.id).first
    @history_edit = History.where(activity_type: "edit_book", activity_id: @book.id)
    @history_edit.each do |history|
      history.destroy
    end
    if @history.nil?
      History.where(activity_type: "add_book", activity_id: @book.id).first.destroy
      @history_delete = current_user.histories.build(activity_type: "delete_book",
        activity_id: @book.user_id)
      @history_delete.save
    else
      @history.destroy
    end
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
