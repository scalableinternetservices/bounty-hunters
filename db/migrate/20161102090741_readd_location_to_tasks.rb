class ReaddLocationToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :string
  end
end
