class RemovePermissionsFromUsersAgain < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :permissions_id
  end
end
