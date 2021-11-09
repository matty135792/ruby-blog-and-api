# frozen_string_literal: true

class RemovePermissionsFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :permissions, null: true, foreign_key: true
  end
end
