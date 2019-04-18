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
    respond_to do |format|
      format.js
      format.html {redirect_to category_book_path @category, @book}
    end
  end

  def destroy
    @chapter = @book.chapters.find_by(id: params[:id])
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
