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
    @history_edit = current_user.histories.where(activity_type: "edit_chapter",
      activity_id: @chapter.id).first
    if @history_edit.present?
      @history_edit.destroy
      @history = current_user.histories.build(activity_type: "edit_chapter",
        activity_id: @chapter.id)
      @history.save
    else
      @history = current_user.histories.build(activity_type: "edit_chapter",
        activity_id: @chapter.id)
      @history.save
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
    @histories_edit = History.where(activity_type: "edit_chapter", activity_id: @chapter.id)
    @histories_edit.each do |history|
      history.destroy
    end
    if @history.nil?
      History.where(activity_type: "add_chapter",
        activity_id: @chapter.id).first.destroy
      @history_delete = current_user.histories.build(activity_type: "delete_chapter", activity_id: @chapter.book.id)
      @history_delete.save
    else
      @history.destroy
    end
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
