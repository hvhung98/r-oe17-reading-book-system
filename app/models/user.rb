class User < ApplicationRecord
  attr_accessor :remember_token
  before_save :downcase_email
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length:
    {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {
    minimum: 6}, allow_nil: true
  scope :ordered_by_name, -> {order name: :asc}
  belongs_to :role
  has_one :history
  has_many :follows
  has_many :categorys, through: :follow
  has_many :books
  has_many :likes
  has_many :books, through: :like
  has_many :comments
  has_many :books, through: :comment

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.email = auth["info"]["email"]
      user.id = auth["uid"]
      user.name = auth["info"]["name"]
      user.password = "password"
      user.password_confirmation = "password"
    end
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  private

  def downcase_email
    email.downcase!
  end

end
