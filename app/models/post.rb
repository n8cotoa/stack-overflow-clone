class Post < ApplicationRecord
  belongs_to :user
  has_many :responses
  validates :title, :presence => true
  validates :body, :presence => true
  scope :count_today, -> { where("created_at >= ?", Time.now.beginning_of_day).count}
end
