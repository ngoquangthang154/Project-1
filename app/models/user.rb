class User < ApplicationRecord
  has_many :comments
  has_many :orders
  has_many :rates
end
