Role.create!(name: "normal")
Role.create!(name: "moderator")
Role.create!(name: "admin")

User.create!(name: "admin",
  email: "admin@gmail.com",
  password: "password", password_confirmation: "password",
  status: false,
  role_id: 3)

20.times do |n|
  name = Faker::Name.name[0..10]
  email = "user#{n+1}@gmail.com"
  role_id = 1
  User.create!(name: name,
    status: false,
    password: "password", password_confirmation: "password",
    role_id: role_id,
    email: email)
end

Category.create!(name: "Học ngoại ngữ")
Category.create!(name: "Khoa học - Kĩ thuật")
Category.create!(name: "Tâm Lý - Kỹ Năng Sống")
Category.create!(name: "Văn hóa - Tôn giáo")
Category.create!(name: "Lịch sử - Chính trị")


20.times do |n|
  name = Faker::Name.name[0..10]
  Author.create!(name: name)
end

100.times do |n|
  name = Faker::Name.name[0..10],
  category_id = n%Category.count+1,
  user_id = n%User.count+1,
  status = true,
  description = "description#{n}"
  Book.create!(name: name,
    category_id: category_id,
    status: status,
    description: description,
    user_id: user_id)
end

100.times do |n|
  category_id = n%Category.count+1
  Follow.create!(user_id: n%User.count+1,
    category_id: category_id)
end

100.times do |n|
  book_id = n%Book.count+1
  Like.create!(user_id: n%User.count+1,
    book_id: book_id)
end

10.times do |n|
  author_id = n%Author.count+1
  book_id = 1
  Writer.create!(author_id: author_id, book_id: book_id)
end

10.times do |n|
  book_id = 1
  user_id = n%User.count+1
  name = Faker::Name.name[0..10],
  content = Faker::Quotes::Shakespeare.hamlet_quote
  Chapter.create!(book_id: book_id, name: name, content: content)
  Comment.create!(book_id: book_id, user_id: user_id, content: content)
end

10.times do |n|
  book_id = 5
  user_id = n%User.count+1
  name = Faker::Name.name[0..10],
  content = Faker::Quotes::Shakespeare.hamlet_quote
  Chapter.create!(book_id: book_id, name: name, content: content)
  Comment.create!(book_id: book_id, user_id: user_id, content: content)
end

10.times do |n|
  book_id = 4
  user_id = n%User.count+1
  name = Faker::Name.name[0..10],
  content = Faker::Quotes::Shakespeare.hamlet_quote
  Chapter.create!(book_id: book_id, name: name, content: content)
  Comment.create!(book_id: book_id, user_id: user_id, content: content)
end
