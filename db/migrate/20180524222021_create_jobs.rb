class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.integer :job_number
      t.string :job_name
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
