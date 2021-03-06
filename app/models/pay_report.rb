class PayReport < ApplicationRecord
	has_many :task_entries


	def self.this_weeks_entries
		x = PayReport.find_start_of_week
		y = TaskEntry.where('start_date BETWEEN ? AND ?', x, Date.tomorrow)
		y = y.select { |z| z.time_entry.status == "approved" && z.pay_report == nil}

		i = TaskEntry.where(pay_report: nil)
		i = i.select { |z| z.time_entry.status == "approved" }
		i.each do |w|
			y << w unless y.include?(w)
		end 
		y
	end

	def self.find_start_of_week
		d = Date.today
		while true
			if d.wday == 1
				break
			end
			d -= 1
		end
		d
		return d
	end

	def self.create_report
		PayReport.create!(
			end: PayReport.find_start_of_week.to_time + 6.days,
			start: PayReport.find_start_of_week.to_time,
			task_entries: PayReport.this_weeks_entries
		)
	end

	def set_users
		u = User.all

		users_task = []

		u.each do |user|
			users_task << self.task_entries.select { |e| e.time_entry.user_id == user.id } unless user.has_role?(:admin)

			#call this method from the XMLS view so that we can print out the data how we need it and stuff and export it and stuff
		end
		return users_task
	end
end