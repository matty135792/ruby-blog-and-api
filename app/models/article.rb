# frozen_string_literal: true

class Article < ApplicationRecord
  include Visible
  scope :most_recent, -> { order(created_at: :desc).limit(5) }
  scope :topic_articles, ->(topic_id) { where('topic_id = ?', topic_id) }
  belongs_to :topic
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
