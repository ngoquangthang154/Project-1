class Typenew < ApplicationRecord
  has_many :news

  private
  def self.search search
    if search
      where("name LIKE ?", "%#{search}%")
    else
      all
    end
  end
end
