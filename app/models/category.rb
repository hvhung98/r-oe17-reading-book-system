class Category < ApplicationRecord
  has_many :follows
  has_many :users, through: :follows
  has_many :books
end
