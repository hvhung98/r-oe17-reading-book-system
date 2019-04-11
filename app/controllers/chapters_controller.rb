class ChaptersController < ApplicationController
  def show
    @category = Category.find_by(id: params[:category_id])
    @book = @category.books.find_by(id: params[:book_id])
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
end
