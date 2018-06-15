class Task < ApplicationRecord
  enum status: { active: 0, inactive: 1}
  has_many :task_entries

  validates_presence_of :title
end
