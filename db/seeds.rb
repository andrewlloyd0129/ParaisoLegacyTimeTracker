
10.times do |job|
  Job.create!(job_number: (14000 + job), job_name: Faker::Address.street_name)
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


10.times do |task|
  Task.create!(title: Faker::Job.field)
end

puts "10 tasks created"

2.times do |i|
  User.create!(
     email: "test#{i}@test.com",
     password: "asdfasdf",
     password_confirmation: "asdfasdf",
     full_name: Faker::FunnyName.two_word_name,
     wage: 15 + i
  )
     14.times do |j|
      TimeEntry.create!(  start_time: (Date.today - j).to_datetime,
                end_time: Time.now,
                user_id: i + 2,
                status: 'approved'
        )
        2.times do |k|
          TaskEntry.create!(  start_time: Time.now - (2*360),
                    end_time: Time.now,
                    task_id: rand(1..10),
                    time_entry: TimeEntry.last,
                    job_id: rand(1..10),
          )
      end
    end
end

puts "2 regular user created with 14 time entries each and 2 task entries per time entry"