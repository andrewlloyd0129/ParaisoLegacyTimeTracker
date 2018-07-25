class TaskEntry < ApplicationRecord
  belongs_to :time_entry
  belongs_to :task
  belongs_to :job
  belongs_to :pay_reports, optional: true
  has_one :user, :through => :time_entry

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
    end
    d.to_datetime
    return d
  end

  def find_start_of_week
    d = self.start_date
    while true
      if d.wday == 1
        break
      end
      d -= 1
    end
    d
    return d
  end

  def find_end_of_week
    d = self.start_date
    while true
      if d.wday == 0
        break
      end
      d += 1
    end
    d
    return d + 1
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
    temp = elapsedSeconds / 36
    self.hours = temp 
    self.save
  end


  def overtime_generator t_hours
    self.overtime = (t_hours + self.hours) - 4000
    self.hours = self.hours - self.overtime
    self.save
  end 

  def is_overtime
    self.overtime = self.hours
    self.hours = 0
    self.save
  end

  def no_overtime
    self.overtime = 0
    self.save
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