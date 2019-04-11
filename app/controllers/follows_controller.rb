class FollowsController < ApplicationController
  def new
    @follow = current_user.follows.build
  end

  def create
    params[:categories][:id].each do |category|
      if !category.empty? && !current_user.follows.find_by(category_id: category)
        @follow = current_user.follows.build(:category_id => category)
        @follow.save
      end
    end
    redirect_to home_path
  end
end
