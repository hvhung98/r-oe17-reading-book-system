class User < ApplicationRecord
  attr_accessor :remember_token
  before_save :downcase_email
  validates :name, presence: true, length: {maximum: Settings.name_max}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length:
    {maximum: Settings.email_max}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {
    minimum: Settings.pass_min}, allow_nil: true
  scope :ordered_by_name, -> {order name: :asc}
  belongs_to :role
  has_many :histories, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :categories, through: :follows
  has_many :books
  has_many :likes, dependent: :destroy
  has_many :books, through: :likes
  has_many :comments, dependent: :destroy
  has_many :books, through: :comments
  has_many :notifications
  CSV_ATTRIBUTES = %w(name email role_id created_at).freeze

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth.provider
      user.email = auth.info.email
      user.id = auth.uid
      user.name = auth.info.name
      user.password = "password"
      user.password_confirmation = "password"
    end
  end

  class << self
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def online
    update_attribute(:status, true)
  end

  def offline
    update_attribute(:status, false)
  end

  private

  def downcase_email
    email.downcase!
  end

end
