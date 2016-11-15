class AddTaskRefsToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :posts, index: true#, foreign_key: true
    add_reference :users, :claims, index: true#, foreign_key: true
  end
end
