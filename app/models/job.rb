class Job < ApplicationRecord
  enum status: { active: 0, inactive: 1}
  has_many :task_entries
  has_many :jobs_csvs

  validates_presence_of :job_name, :job_number

  def to_csv
    CSV.generate do |csv|
      csv << TaskEntry.column_names
      self.task_entries.each do |entry|
        csv << entry.attributes.values_at(*TaskEntry.column_names)

      end
    end
  end
end