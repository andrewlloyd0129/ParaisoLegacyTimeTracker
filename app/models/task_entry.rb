class TaskEntry < ApplicationRecord
  belongs_to :time_entry
  belongs_to :task
  belongs_to :job

  def self.this_weeks_entries ents
    x = TaskEntry.find_start_of_week
    y = ents.find_all { |e| e.start_time.between?(x, Date.tomorrow) == true }
    return y
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
    return d
  end

  def calculate_fields
    wage
    hours_generator
    overtime_generator
    gross_pay_generator
    self.save
  end

  def wage
    self.wage = self.time_entry.user.wage
    self.save
  end

  def hours_generator
    elapsedSeconds = self.end_time - self.start_time
    temp = elapsedSeconds / 36
    self.hours = temp 
    self.save
  end

  def overtime_generator
    z = self.job_id
    y = []
    x = TaskEntry.this_weeks_entries TaskEntry.where(job_id: z)
    x.each do |it|
      y << it.hours
    end 

    z = y.inject(:+)

    if z < 40
      self.overtime = 0
    elsif z > 40
      self.hours = 40
      self.overtime = z - 40
    end
    self.save
  end

  def gross_pay_generator
    x = self.hours * self.wage
    y self.overtime * self.wage * 1.5 
    self.gross_pay = x + y
  end

  def payroll_burden_generator
    self.payroll_burden = self.gross_pay * self.job.JobsCsv.last.payroll_burden
  end

  def total_cost
    self.total_cost = self.payroll_burden + self.gross_pay
  end
end