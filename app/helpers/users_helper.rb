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

  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
