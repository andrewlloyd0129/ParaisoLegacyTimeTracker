class PayReport < ApplicationRecord
	has_many :task_entries


		def self.this_weeks_entries
			x = PayReport.find_start_of_week
			y = TaskEntry.where('start_time BETWEEN ? AND ?', x, Date.tomorrow)
			return y
		end

		def self.find_start_of_week
			d = Date.today
			while true
				if d.wday == 1
					break
				end
				d -= 1
			end
			d.to_datetime
			return d
		end


	def self.create_report
		PayReport.create!(

				start: Time.now,
				end: Time.now,
				task_entries: PayReport.this_weeks_entries
			)
	end

	def gen_report
		u = User.all

		users_task = []

		u.each do |user|
			users_task << self.task_entries.select { |e| e.user_id == user.id }

			#call this method from the XMLS view so that we can print out the data how we need it and stuff and export it and stuff
		end
	end
end