class TaskEntry < ApplicationRecord
  belongs_to :time_entry
  belongs_to :task
  belongs_to :job

  def self.this_weeks_entries ents
    x = TimeEntry.find_start_of_week
    ents.select { |e| e.start_time.between?(x, Date.today) == true }
  end

  def self.find_start_of_week
    d = Date.today
    while true
      if d.wday == 1
        break
      end
      d -= 1
      puts d.wday
    end
    d.to_datetime
  end

  def calculate_fields
    wage
    hours_generator
    hours_generator
    self.save
  end

  def wage
    self.wage = self.time_entry.user.wage
  end

  def hours_generator
    elapsedSeconds = self.end_time - self.start_time
    temp = elapsedSeconds / 36
    self.hours = temp 
  end

  def overtime_generator
    x = TaskEntry.where(job_id: self.job_id).this_weeks_entries

  end
end

  # create_table "task_entries", force: :cascade do |t|
  #   t.integer "overtime"
  #   t.string "gross_pay"
  #   t.string "payroll_burden"
  #   t.string "total_cost"
