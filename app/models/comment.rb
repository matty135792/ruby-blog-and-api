class Comment < ApplicationRecord
  include Visible
  belongs_to :article
  scope :most_recent, -> {order(created_at: :desc).limit(5)}
end