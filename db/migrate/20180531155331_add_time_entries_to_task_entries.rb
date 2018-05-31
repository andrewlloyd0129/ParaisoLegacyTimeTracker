class AddTimeEntriesToTaskEntries < ActiveRecord::Migration[5.1]
  def change
  	  	add_reference :task_entries, :time_entry, foreign_key: true
  end
end
