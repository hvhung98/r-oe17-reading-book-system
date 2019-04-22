module UsersHelper
  def count_online
    @count_online = User.where(status: true).count
  end

  def count_user
    @count_user = User.count
  end

  def book_released
    @book_released = Book.published.count
  end

  def count_book
    @count_book = Book.count
  end

  def count_comment
    @count_comment = Comment.count
  end

  def book_has_cmt
    @count_book_has_cmt = Comment.select("distinct book_id").map(&:book_id).count;
  end

  def count_like
    @count_like = Like.count
  end

  def book_has_like
    @count_book_has_like = Like.select("distinct book_id").map(&:book_id).count;
  end
end
