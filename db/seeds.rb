Category.create!(name: "Học ngoại ngữ")
Category.create!(name: "Khoa học - Kĩ thuật")
Category.create!(name: "Tâm Lý - Kỹ Năng Sống")
Category.create!(name: "Văn hóa - Tôn giáo")
Category.create!(name: "Lịch sử - Chính trị")

Role.create!(name: "normal")
Role.create!(name: "moderrator")
Role.create!(name: "admin")

User.create!(name: "admin",
  email: "admin@gmail.com",
  password: "foobar", password_confirmation: "foobar",
  status: false,
  role_id: 3)
20.times do |n|
  name = Faker::Name.name
  email = "user#{n+1}@gmail.com"
  password = "password"
  role_id = 1
  User.create!(name: name,
    status: false,
    password: "password", password_confirmation: "password",
    role_id: role_id,
    email: email)
end

100.times do |n|
  name = Faker::Name.name,
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
