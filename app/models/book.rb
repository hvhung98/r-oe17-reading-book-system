class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :chapters, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
  has_many :writers, dependent: :destroy
  has_many :authors, through: :writers
  validates :category_id, presence: true
  validates :name, presence: true
  validates :description, presence: true
  scope :order_by_time, -> {order created_at: :desc}
  scope :published, -> {where status: true}
  mount_uploader :image, PictureUploader
  accepts_nested_attributes_for :chapters
end
