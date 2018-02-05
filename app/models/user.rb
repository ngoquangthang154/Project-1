class User < ApplicationRecord
  has_many :comments
  has_many :orders
  has_many :rates

  attr_accessor :remember_token

  validates :username, presence: true, length:{maximum: Settings.maximum_username}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length:{maximum: Settings.maximum_email},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, presence: true,
    length: {maximum: Settings.maximum_pass},
    allow_nil: true
  validates :name, presence: true, length: {maximum: Settings.maximum_name}

  VALID_PHONE_REGEX = /\d[0-9]\)*\z/
  validates :phone, presence: true, numericality: true,
    length: {maximum: Settings.maximum_phone},
    format: {with: VALID_PHONE_REGEX }

  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

     def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end

  def authenticated? remember_token
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute :remember_token, nil
  end

  private
  def self.search search
    if search
      where("name LIKE ? or username LIKE ?", "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end
