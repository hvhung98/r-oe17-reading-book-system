FactoryBot.define do
  factory :user do
    name {"admin123"}
    email {"admin123@gmail.com"}
    password {"foobar"}
    password_confirmation {"foobar"}
  end

  factory :user1, class: User do
    name {"admin1234"}
    email {"admin1234@gmail.com"}
    password {"password"}
    password_confirmation {"password"}
    role_id {2}
  end

  factory :invalid_user, class: User do
    name {""}
    email {"hvhung98@gmail.com"}
    password {"password"}
    password_confirmation {"password"}
  end
end