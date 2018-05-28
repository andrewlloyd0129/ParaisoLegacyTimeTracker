class TaskEntry < ApplicationRecord
  belongs_to :TimeEntries

  validate_presece_of :start_time

  def self.switchtask ctask
  	ctask.end_time = time now

  	ctask save

  	ctask = TaskEntry.new

  	ctask.start_time = time.now

  	
  end
end
