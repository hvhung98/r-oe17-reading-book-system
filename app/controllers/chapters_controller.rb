class ChaptersController < ApplicationController
  before_action :set_category
  before_action :set_book
  def new
    @chapter = @book.chapters.build
  end

  def create
    @chapter = @book.chapters.build(chapter_params)
    @chapter.book_id = @book.id
    if @chapter.save
      @history = current_user.histories.build(activity_type: "add_chapter",
        activity_id: @chapter.id)
      @history.save
      if current_user.id != @book.user.id
        @notification = Notification.new(used_send: current_user.id,
          user_receive: @book.user.id, activity_type: "add_chapter",
          activity_id: @chapter.id)
        @notification.save
      end
      respond_to do |format|
        format.js
        format.html {redirect_to category_book_path @category, @book}
      end
    end
  end

  def show
    @feed_chapters = @book.chapters
    @chapter = @feed_chapters.find_by(id: params[:id])
    @position_chapter = @feed_chapters.index(@chapter) + 1
    if @position_chapter > 1 && @position_chapter < @feed_chapters.count
      @prev_chapter = @feed_chapters[@position_chapter - 2]
      @next_chapter = @feed_chapters[@position_chapter]
    elsif @position_chapter == 1
      @next_chapter = @feed_chapters[@position_chapter]
    elsif @position_chapter == @feed_chapters.count
      @prev_chapter = @feed_chapters[@position_chapter - 2]
    end
    store_location
  end

  def edit
    @chapter = @book.chapters.find_by(id: params[:id])
  end

  def update
    @chapter = @book.chapters.find_by(id: params[:id])
    @chapter.update(chapter_params)
    if current_user.id != @book.user.id
      @notification = Notification.new(used_send: current_user.id,
        user_receive: @book.user.id, activity_type: "edit_chapter",
        activity_id: @chapter.id, status: @chapter.updated_at)
      @notification.save
    end
    respond_to do |format|
      format.js
      format.html {redirect_to category_book_path @category, @book}
    end
  end

  def destroy
    @chapter = @book.chapters.find_by(id: params[:id])
    @history = current_user.histories.where(activity_type: "add_chapter",
      activity_id: @chapter.id).first
    if @history.nil?
      @history_other = History.where(activity_type: "add_chapter", activity_id: @chapter.id).first
      if @history_other.present?
        @history_other.destroy
      end
    else
      @history.destroy
    end
    Notification.where(user_receive: @book.user.id,
      activity_type: "add_chapter", activity_id: @chapter.id).first.destroy
    @notifi_edit = Notification.where(user_receive: @book.user.id,
      activity_type: "edit_chapter", activity_id: @chapter.id)
    @notifi_edit.each do |notifi|
      notifi.destroy
    end
    @notification = Notification.new(used_send: current_user.id,
      user_receive: @book.user.id, activity_type: "delete_chapter",
      activity_id: @book.id, status: @chapter.name)
    @notification.save
    @chapter.destroy
    respond_to do |format|
      format.js
      format.html {redirect_to category_book_path @category, @book}
    end
  end

  private

  def chapter_params
    params.require(:chapter).permit :name, :content
  end

  def set_category
    @category = Category.find_by(id: params[:category_id])
  end

  def set_book
    @book = Book.find_by(id: params[:book_id])
  end
end
