class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :chapters
  has_many :likes
  has_many :users, through: :likes
  has_many :comments
  has_many :users, through: :comments
  has_many :written_bys
  has_many :authors, through: :writers
end
