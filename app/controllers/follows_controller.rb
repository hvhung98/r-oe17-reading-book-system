class FollowsController < ApplicationController
  def new
    @follow = current_user.follows.build
    @categories = Category.all.map {|c| [c.name, c.id]}
  end

  def create
    params[:category][:id].each do |category|
      if !category.empty? && !current_user.follows.find_by(category_id: category)
        @follow = current_user.follows.build(:category_id => category)
        @follow.user_id = current_user.id
        @follow.save
      end
    end
    redirect_to home_path
  end
end
