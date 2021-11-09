# frozen_string_literal: true

class UpdateUserToTopics < ActiveRecord::Migration[6.1]
  def change
    Topic.update_all(user_id: 5)
    change_column :topics, :user_id, :integer, null: false, foreign_key: true
  end
end
