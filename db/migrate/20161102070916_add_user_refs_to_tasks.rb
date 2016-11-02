class AddUserRefsToTasks < ActiveRecord::Migration
  def change
    add_reference :tasks, :owner, index: true, foreign_key: true
    add_reference :tasks, :claimer, index: true, foreign_key: true
  end
end
