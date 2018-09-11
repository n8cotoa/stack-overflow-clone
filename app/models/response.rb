class Response < ApplicationRecord
  belongs_to :user
  belongs_to :post
  scope :count_today, -> {where("created_at >= ?", Time.now.beginning_of_day).count}
end
