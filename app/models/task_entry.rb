class TaskEntry < ApplicationRecord
  belongs_to :time_entry
  belongs_to :task
  belongs_to :job
  belongs_to :pay_reports, optional: true

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
    d
    return d
  end

  def calculate_fields
    calculate_wage
    overtime_generator
    gross_pay_generator
  end

  def calculate_wage
    self.wage = self.time_entry.user.wage
    self.save
  end

  def hours_generator
    elapsedSeconds = self.end_time - self.start_time
    temp = elapsedSeconds / 3600
    self.hours = temp 
    self.save
  end

  def overtime_generator
    t = self.job_id
    y = []
    z = 0
    x = TaskEntry.this_weeks_entries TaskEntry.where(job_id: t)
    x.each do |it|
      z += it.hours.to_i
      if z < 40
        self.overtime = 0
      elsif z > 40
        self.overtime = z - 40
        self.hours = self.hours - self.overtime
      end
        self.save
    end 

  
    # byebug

  end

  def gross_pay_generator
    x = self.hours.to_i * self.wage.to_i
    y = self.overtime.to_i * self.wage.to_i * 1.5 
    self.gross_pay = x + y
    self.save
  end

  def payroll_burden_generator
    self.payroll_burden = self.gross_pay.to_i * self.job.jobs_csvs.last.payrollburden
    self.save
  end

  def total_cost_generator
    self.total_cost = self.payroll_burden.to_i + self.gross_pay.to_i
    self.save
  end
end