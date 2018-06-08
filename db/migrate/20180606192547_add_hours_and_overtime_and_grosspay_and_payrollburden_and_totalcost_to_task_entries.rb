class AddHoursAndOvertimeAndGrosspayAndPayrollburdenAndTotalcostToTaskEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :task_entries, :hours, :string
    add_column :task_entries, :overtime, :integer
    add_column :task_entries, :wage, :string
    add_column :task_entries, :gross_pay, :string
    add_column :task_entries, :payroll_burden, :string
    add_column :task_entries, :total_cost, :string
  end
end
