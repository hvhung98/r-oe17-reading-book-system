class Category < ApplicationRecord
  has_many :follows
  has_many :users, through: :follow
  has_many :books
end
