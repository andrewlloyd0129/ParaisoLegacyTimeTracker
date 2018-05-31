
10.times do |job|
  Job.create!(job_number: (14000 + job), job_name: "andrew #{job}")
end

puts "10 jobs created"

User.create!(
   email: "admin@test.com",
   password: "asdfasdf",
   password_confirmation: "asdfasdf",
   roles: "admin"
)

puts "1 admin user created"

User.create!(
   email: "test@test.com",
   password: "asdfasdf",
   password_confirmation: "asdfasdf"
)

puts "1 regular user created"

10.times do |task|
  Task.create!(title: "I made a task #{task}")
end

puts "10 tasks created"

10.times do |i|
	TimeEntry.create!( 	start_time: Time.now - i,
						end_time: Time.now - i,
						user: User.first
		)
	10.times do |j|
		TaskEntry.create!( 	start_time: Time.now - j,
							end_time: Time.now - j,
							task: Task.find_by_id(j + 1),
							time_entry: TimeEntry.last
			)
	end
end
