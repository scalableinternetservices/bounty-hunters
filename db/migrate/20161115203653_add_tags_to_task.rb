class AddTagsToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :tags, :string, :default => []
  end
end
