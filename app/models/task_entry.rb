class TaskEntry < ApplicationRecord
  belongs_to :time_entry
  belongs_to :task
  belongs_to :job, optional: true

  # validates_presence_of :start_time

end
