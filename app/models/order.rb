class Order < ApplicationRecord
  belongs_to :user

  has_many :orderDetails

  private
  def self.getlist id
    if id
      order(created_at: :desc).where(user_id: id)
    end
  end
end
