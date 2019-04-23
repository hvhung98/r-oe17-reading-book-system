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
    @admin = User.find_by(role_id: 3)
    @all_user = User.where.not(role_id: 3)
    @all_book = Book.all.order_by_time.paginate(page: params[:page], per_page: 15)
    @all_cmt = Comment.all.order_by_time.paginate(page: params[:page], per_page: 15)
    @all_histories = History.all.order_by_time.paginate(page: params[:page], per_page: 15)
    if logged_in?
      if current_user.role_id == 1
        flash[:warning] = "Bạn không có quyền admin"
        redirect_to home_path
      end
    else
      redirect_to root_path
    end

  end
end
