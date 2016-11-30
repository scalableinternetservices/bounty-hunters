class AddIndexToTask < ActiveRecord::Migration
  def change
    add_index :tasks, :completer_id
  end
end
