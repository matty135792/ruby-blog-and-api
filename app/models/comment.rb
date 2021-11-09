# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  scope :most_recent, -> { order(created_at: :desc).limit(3) }

  validates :body, presence: true, length: { minimum: 1 }
end
