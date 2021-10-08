class AddPermissionsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :permissions_users, :id => false do |t|
      t.integer :permission_id
      t.integer :user_id
    end
  end
end
