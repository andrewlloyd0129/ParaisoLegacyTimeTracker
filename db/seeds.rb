
10.times do |job|
  Job.create!(job_number: (14000 + job), job_name: "andrew #{job}")
end

puts "10 jobs created"

User.create!(
   email: "admin@test.com",
   password: "asdfasdf",
   password_confirmation: "asdfasdf",
   roles: "admin",
   full_name: "Admin User",
   wage: 15
)

puts "1 admin user created"

2.times do |i|
  User.create!(
     email: "test#{i}@test.com",
     password: "asdfasdf",
     password_confirmation: "asdfasdf",
     full_name: "regUser #{i}",
     wage: 15 + i
  )
end

puts "2 regular user created"

10.times do |task|
  Task.create!(title: "I made a task #{task}")
end

puts "10 tasks created"

2.times do |i|
	TimeEntry.create!( 	start_time: Time.now,
						end_time: Time.now,
						user_id: 2,
            status: 'approved'
		)
	2.times do |j|
		TaskEntry.create!( 	start_time: Time.now,
							end_time: Time.now,
							task: Task.find_by_id(j + 1),
							time_entry: TimeEntry.last,
              job_id: 1
			)
	end
end

2.times do |i|
TimeEntry.create!(  start_time: Time.now,
          end_time: Time.now,
          user_id: 3,
          status: 'approved'
  )
  2.times do |j|
    TaskEntry.create!(  start_time: Time.now,
              end_time: Time.now,
              task: Task.find_by_id(j + 1),
              time_entry: TimeEntry.last,
              job_id: 2
      )
  end

end
  puts "4 task entries created"
