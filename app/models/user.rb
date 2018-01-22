class User < ApplicationRecord
  has_many :comment
  has_many :order
  has_many :rate
end
