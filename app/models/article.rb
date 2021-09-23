class Article < ApplicationRecord
  include Visible
  scope :most_recent, -> {order(created_at: :desc).limit(5)}
  belongs_to :topic
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end