class AddIndexToUser < ActiveRecord::Migration
  def change
    add_index :users, :completes_id
  end
end
