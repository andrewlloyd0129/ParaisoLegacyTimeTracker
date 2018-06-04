class TimeEntry < ApplicationRecord
  enum status: { active: 0, pending: 1, approved: 2}
  belongs_to :user
  has_many :task_entries, :dependent => :destroy

  accepts_nested_attributes_for :task_entries
end