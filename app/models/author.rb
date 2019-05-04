class Author < ApplicationRecord
  has_many :writers
  has_many :books, through: :writers
end
