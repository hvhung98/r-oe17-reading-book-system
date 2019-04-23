class HistoriesController < ApplicationController
  def index
    @user = User.find_by(id: current_user.id)
    @histories = @user.histories.order_by_time
  end
end
