class Job < ApplicationRecord
  enum status: { active: 0, inactive: 1}
  has_many :task_entries
  has_many :jobs_csvs

  validates_presence_of :job_name, :job_number, :JobNameAndNumber
  # so this one time i didnt do rails for a long time and thought I remembered how to run a migration and how JobNameAndNumber is not snake case...

  def to_csv
    CSV.generate do |csv|
      csv << TaskEntry.column_names
      self.task_entries.each do |entry|
        csv << entry.attributes.values_at(*TaskEntry.column_names)

      end
    end
  end
end