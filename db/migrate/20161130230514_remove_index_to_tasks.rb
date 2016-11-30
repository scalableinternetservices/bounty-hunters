class RemoveIndexToTasks < ActiveRecord::Migration
  def change
    remove_index :tasks, column: :claimer_id
    remove_index :tasks, column: :owner_id
  end
end
