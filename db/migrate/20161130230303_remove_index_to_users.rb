class RemoveIndexToUsers < ActiveRecord::Migration
  def change
    remove_index :users, column: :posts_id
    remove_index :users, column: :claims_id
    remove_index :users, column: :completes_id
    remove_index :users, column: :email
    remove_index :users, column: :reset_password_token
  end
end
