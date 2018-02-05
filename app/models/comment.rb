class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  scope :getlistcmt, -> (id){where(:reply => id).order(time_cmt: :asc)}

  scope :countcmt, -> {where(:reply => 0).order(created_at: :desc)}
end
