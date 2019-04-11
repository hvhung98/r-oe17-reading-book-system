class CategoriesController < ApplicationController
  before_action :set_category, except: %i(new create)

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      @follow = @category.follows.build
      @follow.user_id = current_user.id
      @follow.category_id = @category.id
      @follow.save
      respond_to do |format|
        format.js
        format.html {redirect_to @category}
      end
    else
      render :new
    end
  end

  def show
    @count_book = 1
    @categories = Category.all
    @books = @category.books.paginate(page: params[:page], per_page: 12)
  end

  def edit
  end

  def update
    @category.update(category_params)
    respond_to do |format|
      format.js
      format.html {redirect_to @category}
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.js
      format.html {redirect_to home_path}
    end
  end

  private

  def category_params
    params.require(:category).permit :name
  end

  def set_category
    @category = Category.find_by(id: params[:id])
    if @category.nil?
      flash[:danger] = "Invalid category"
      redirect_to home_path
    end
  end
end
