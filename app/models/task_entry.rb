class TaskEntry < ApplicationRecord
  belongs_to :time_entry
  belongs_to :task
  belongs_to :job, optional: true

  def calculate_fields
    wage
    hours_generator
    self.save
  end

  def wage
    self.wage = self.time_entry.user.wage
  end

  def hours_generator
    var = self.end_time - self.start_time
    var = var / 360
    self.hours = var
  end
end

  # create_table "task_entries", force: :cascade do |t|
  #   t.string "hours"
  #   t.integer "overtime"
  #   t.string "gross_pay"
  #   t.string "payroll_burden"
  #   t.string "total_cost"
  #   t.index ["job_id"], name: "index_task_entries_on_job_id"
  #   t.index ["task_id"], name: "index_task_entries_on_task_id"
  #   t.index ["time_entries_id"], name: "index_task_entries_on_time_entries_id"
  #   t.index ["time_entry_id"], name: "index_task_entries_on_time_entry_id"
  # end