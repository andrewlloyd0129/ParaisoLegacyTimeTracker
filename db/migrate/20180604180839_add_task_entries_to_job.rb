class AddTaskEntriesToJob < ActiveRecord::Migration[5.1]
  def change
    add_reference :task_entries, :job, foreign_key: true
  end
end
