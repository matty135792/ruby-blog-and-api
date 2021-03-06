# frozen_string_literal: true

class AddUserRefToArticles < ActiveRecord::Migration[6.1]
  def change
    add_reference :articles, :user, foreign_key: true
  end
end
