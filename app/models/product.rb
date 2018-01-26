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

  def self.search search
    if search
      where("name LIKE ? or keys LIKE ?", "%#{search}%", "%#{search}%")
    else
      all
    end
  end

  def self.filtersearch search, trademark, assort, max, min
    fil = ""
    if search
      where("name LIKE ? or keys LIKE ?", "%#{search}%", "%#{search}%")
    elsif !search
      if !trademark.blank?
        fil = fil + " trademark_id = #{trademark} and"
      end
      if !assort.blank?
        fil = fil + " assort_id = #{assort} and"
      end
      if !max.blank?
        fil = fil + " price <= #{max} and"
      end
      if !min.blank?
        fil = fil + " price >= #{min}"
      else
        fil = fil[0..(fil.length - 4)]
      end

      if fil.blank?
        all
      else
        where(fil)
      end
    end
  end

end
