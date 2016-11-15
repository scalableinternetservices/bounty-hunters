class FixAddressColumnName < ActiveRecord::Migration
  def change
    rename_column :tasks, :location, :address
  end
end
