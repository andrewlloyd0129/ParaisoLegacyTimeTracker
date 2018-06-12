class TaskEntry < ApplicationRecord
  belongs_to :time_entry
  belongs_to :task
  belongs_to :job, optional: true
end
