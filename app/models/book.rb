class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :chapters
  has_many :likes
  has_many :users, through: :likes
  has_many :comments
  has_many :users, through: :comments
<<<<<<< HEAD
  has_many :written_bys
  has_many :authors, through: :writers
=======
  has_many :writers
  has_many :authors, through: :writers
  validates :category_id, presence: true
  validates :name, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 100}
>>>>>>> User follow category
end
