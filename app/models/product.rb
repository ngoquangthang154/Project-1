class Product < ApplicationRecord
  belongs_to :trademark
  belongs_to :assort

  has_many :comment
  has_many :orderDetail
  has_many :rate
end
