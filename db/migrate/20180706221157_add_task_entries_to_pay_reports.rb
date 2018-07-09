class AddTaskEntriesToPayReports < ActiveRecord::Migration[5.1]
  def change
  	    add_reference :task_entries, :pay_report, foreign_key: true
  end
end
