class UpdateUserRefOfArticles < ActiveRecord::Migration[6.1]
  def change
    Article.update_all(user_id: 5)
    change_column :articles, :user_id, :integer , null: false, foreign_key: true
  end
end
