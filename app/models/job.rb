class Job < ApplicationRecord
  enum status: { active: 0, inactive: 1}
  has_many :task_entries

  validates_presence_of :job_name, :job_number

  def to_csv
    column_names = ["id", "start_time", "end_time"]
    CSV.generate do |csv|
      csv << column_names
      self.task_entries.each do |entry|
        csv << entry.attributes.values_at(*column_names)

      end
    end
  end
end