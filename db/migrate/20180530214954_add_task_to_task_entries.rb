class AddTaskToTaskEntries < ActiveRecord::Migration[5.1]
  def change
  	add_reference :task_entries, :task, foreign_key: true
  end
end
