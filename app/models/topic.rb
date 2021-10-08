class Topic < ApplicationRecord
  scope :most_recent, -> {order(created_at: :desc).limit(5)}
  has_many :articles, dependent: :destroy
  belongs_to :user


  validates :title, presence: true, length: { minimum: 5 }
end
