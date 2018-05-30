class AddUsersToTimeEntries < ActiveRecord::Migration[5.1]
  def change
    add_reference :time_entries, :user, foreign_key: true
  end
end
