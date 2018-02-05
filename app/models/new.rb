class New < ApplicationRecord
  belongs_to :typenew

  scope :getall, -> {order(day_create: :desc).select :id, :img_thumb, :title, :day_create, :typenew_id}

  scope :withtpye, -> (type_id){where("typenew_id = ?", "#{type_id.to_i}").order(day_create: :desc)}

  scope :getlist, -> (id){order(day_create: :desc).where.not(id: id).where(:typenew => New.find_by_id(id).typenew.id).limit(5).select :title, :day_create, :id}
  private
  def self.search search
    if search
      where("title LIKE ? or description LIKE ? or content LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end
