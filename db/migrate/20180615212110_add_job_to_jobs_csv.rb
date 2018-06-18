class AddJobToJobsCsv < ActiveRecord::Migration[5.1]
  def change
    add_reference :jobs_csvs, :job, foreign_key: true
  end
end
