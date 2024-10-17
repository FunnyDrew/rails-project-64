class AddUserRefToPosts < ActiveRecord::Migration[7.1]
  def change
    add_reference :posts, :creator, null: false, foreign_key: { to_table: :users }
  end
end
