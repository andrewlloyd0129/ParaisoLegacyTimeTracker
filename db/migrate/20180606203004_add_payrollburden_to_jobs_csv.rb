class AddPayrollburdenToJobsCsv < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs_csvs, :payrollburden, :integer
  end
end
