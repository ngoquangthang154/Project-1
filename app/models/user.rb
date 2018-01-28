class User < ApplicationRecord
  has_many :comments
  has_many :orders
  has_many :rates

  validates :username, presence: true, length:{maximum: 30}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length:{maximum: 50},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, presence: true,
    length: {maximum: 20},
    allow_nil: true
  validates :name, presence: true, length: {maximum: 50}

  VALID_PHONE_REGEX = /\d[0-9]\)*\z/
  validates :phone, presence: true, numericality: true, 
    length: {maximum: 11}, 
    format: {with: VALID_PHONE_REGEX }
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
