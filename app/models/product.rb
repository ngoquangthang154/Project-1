class Product < ApplicationRecord
  belongs_to :trademark
  belongs_to :assort

  has_many :comments
  has_many :orderDetails
  has_many :rates

  validates :name,presence: true, length: {maximum: 10}
  validates :content,presence: true, length: {maximum: 100}
  VALID_PRICE_REGEX = /\A(\$)?(\d+)(\.|,)?\d{0,2}?\z/
  validates :price,presence: true,format: {with: VALID_PRICE_REGEX },uniqueness: { case_sensitive: false }

end
