# frozen_string_literal: true

class CreatePostLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :post_likes, primary_key: [:user_id, :post_id] do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
