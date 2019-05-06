FactoryBot.define do
  factory :book do
    user_id {1}
    category_id {1}
    name {"Game of thrones"}
    description {"Hay, hap dan"}
  end

  factory :invalid_book, class: Book do
    user_id {nil}
    category_id {1}
    name {""}
    description {"Loi cuon, tuyet voi"}
  end
end
