class Rate < ApplicationRecord
  belongs_to :User
  belongs_to :product
end
