class Comment < ApplicationRecord
  include Visible
  belongs_to :article
  scope :most_recent, -> {order(created_at: :desc).limit(3)}

  validates :commenter, presence: true
  validates :body, presence: true, length: { minimum: 5 }
end