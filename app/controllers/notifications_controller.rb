class NotificationsController < ApplicationController
  before_action :set_notification

  def index
    @all_notifi = Notification.where(user_receive: current_user.id).order_by_time
    store_location
  end

  def edit
  end

  def update
    if @notification.activity_type == "delete_book"
      @book = Book.find_by(id: @notification.activity_id)
      @notifi_rep = Notification.new(used_send: current_user.id, user_receive:
        @notification.used_send, activity_type: "done_delete",
        activity_id: 0, status: @book.name)
      @notifi_rep.save
      @book.destroy
      @notification.destroy
      respond_to do |format|
        format.js
        format.html {redirect_back_or home_path}
      end
    end
  end

  def destroy
    @notification.destroy
    respond_to do |format|
      format.js
      format.html {redirect_back_or home_path}
    end
  end

  private

  def set_notification
    @notification = Notification.find_by(id: params[:id])
  end
end
