class Category < ApplicationRecord
<<<<<<< HEAD
  has_many :follows
  has_many :users, through: :follows
  has_many :books
=======
  validates :name, presence: true, length: {maximum: 50}, uniqueness: true
  has_many :follows, dependent: :destroy
  has_many :users, through: :follows
  has_many :books, dependent: :destroy
>>>>>>> User follow category
end
