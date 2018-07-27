namespace :report do
  desc "Generates pay report every week"
  task pay: :environment do
  	# if Time.now.sunday?
  		PayReport.create_report
  	# end
  end

end
