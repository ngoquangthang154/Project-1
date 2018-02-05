class Trademark < ApplicationRecord
  has_many :products

  private
  def self.search search
    if search
      where("name LIKE ?", "%#{search}%")
    else
      all
    end
  end
end
