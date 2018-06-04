class CreateJobsCsvs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs_csvs do |t|
      t.text :csv

      t.timestamps
    end
  end
end
