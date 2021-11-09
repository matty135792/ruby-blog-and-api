# frozen_string_literal: true

class AddPermissionsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :permissions, null: true, foreign_key: true
  end
end
