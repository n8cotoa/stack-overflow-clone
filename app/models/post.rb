class Post < ApplicationRecord
  belongs_to :user
  has_many :responses
  validates :title, :presence => true
  validates :body, :presence => true
end
