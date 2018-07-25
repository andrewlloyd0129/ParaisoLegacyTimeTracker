3.times do |job|
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

1.times do |i|
  User.create!(
     email: "test#{i}@test.com",
     password: "asdfasdf",
     password_confirmation: "asdfasdf",
     full_name: Faker::FunnyName.two_word_name,
     wage: 15 + i
  )
     12.times do |j|
      TimeEntry.create!(  
                start_time: Time.new(1,1,1,0,0,0),
                end_time: Time.new(1,1,1,10,0,0),
                start_date: (Date.today - 11 +j ),
                end_date: (Date.today - 11 +j ),
                user_id: i + 2,
                status: 'approved'
        )
        1.times do |k|
          TaskEntry.create!(  
                    start_time:Time.new(1,1,1,0,0,0),
                    end_time: Time.new(1,1,1,10,0,0),
                    start_date: (Date.today - 11 +j ),
                    end_date: (Date.today - 11 +j ),
                    task_id: rand(1..10),
                    time_entry: TimeEntry.last,
                    job_id: rand(1..3),
          )
          t = TaskEntry.last
          t.hours_generator
          
          if t.start_date.wday > 4 || t.start_date.wday == 0
            t.is_overtime
          end

      end
    end
end

puts "2 regular user created with 14 time entries each and 2 task entries per time entry"