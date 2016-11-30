class AddCompletesIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :completes_id, :integer
  end
end
