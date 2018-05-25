class CreateTimeEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :time_entries do |t|
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
