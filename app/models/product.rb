class Product < ApplicationRecord
  belongs_to :trademark
  belongs_to :assort

  has_many :comments
  has_many :orderDetails
  has_many :rates

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

  def self.getdetail id
    if id
      eager_load(:rates, :comments).find_by_id(id)
    end
  end
end
