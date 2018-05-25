class CreateTaskEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :task_entries do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :time_entries, foreign_key: true

      t.timestamps
    end
  end
end
