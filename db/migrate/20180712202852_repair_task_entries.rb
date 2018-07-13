class RepairTaskEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :task_entries, :hours, :integer
    add_column :task_entries, :overtime, :integer
    add_column :task_entries, :wage, :integer
    add_column :task_entries, :gross_pay, :integer
    add_column :task_entries, :payroll_burden, :integer
    add_column :task_entries, :total_cost, :integer
  end
end
