class JobsCsv < ApplicationRecord
  belongs_to :job

  def populate_fields
    self.job.task_entries.each do |entry|
      entry.calculate_fields
    end
  end

end
