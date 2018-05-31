class TaskEntry < ApplicationRecord
  belongs_to :time_entry
  belongs_to :task

  # validates_presence_of :start_time

end
