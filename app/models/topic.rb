class Topic < ApplicationRecord
  scope :most_recent, -> {order(created_at: :desc).limit(5)}
  has_many :articles
end
