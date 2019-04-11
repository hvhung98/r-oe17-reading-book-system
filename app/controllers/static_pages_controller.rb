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
  end
end
