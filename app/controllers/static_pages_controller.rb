class StaticPagesController < ApplicationController
  def home
    @count_category = 1
    @count_book = 1
    if !logged_in?
      @categories = Category.all
    else
      @feed_categories = current_user.categories
      @categories = Category.all
    end
    store_location
  end

  def index
    if logged_in?
      if current_user.role_id != 3
        flash[:warning] = "Bạn không có quyền admin"
        redirect_to home_path
      end
    else
      redirect_to root_path
    end
    @all_user = User.where.not(role_id: 3).paginate(page: params[:page],
      per_page: 15)
    @all_book = Book.all.paginate(page: params[:page], per_page: 15)
    @all_cmt = Comment.all.paginate(page: params[:page], per_page: 15)
  end
end
