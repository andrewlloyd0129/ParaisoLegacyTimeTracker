class CreateTimeEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :time_entries do |t|
      t.date :start_date
      t.time :start_time
      t.date :end_date
      t.time :end_time

      t.timestamps
    end
  end
end
