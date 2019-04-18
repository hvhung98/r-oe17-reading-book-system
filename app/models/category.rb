class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :follows, dependent: :destroy
  has_many :users, through: :follows
  has_many :books, dependent: :destroy
end
