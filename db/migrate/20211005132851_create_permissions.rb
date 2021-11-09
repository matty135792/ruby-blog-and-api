# frozen_string_literal: true

class CreatePermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :permissions do |t|
      t.string :title

      t.timestamps
    end
  end
end
