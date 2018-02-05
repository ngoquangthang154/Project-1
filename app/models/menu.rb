class Menu < ApplicationRecord
  private
  def self.search search
    if search
      where("name LIKE ?", "%#{search}%")
    else
      all
    end
  end
end
