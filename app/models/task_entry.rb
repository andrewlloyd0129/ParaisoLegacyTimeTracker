class TaskEntry < ApplicationRecord
  # belongs_to :TimeEntries, optional: true
  belongs_to :task

  # validates_presence_of :start_time

end
