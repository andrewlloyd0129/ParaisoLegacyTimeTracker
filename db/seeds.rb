10.times do |job|
  Job.create!(job_number: (14000 + job), job_name: "andrew #{job}")
end

puts "10 jobs created"