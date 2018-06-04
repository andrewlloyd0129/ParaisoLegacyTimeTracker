class JobsCsv < ApplicationRecord

  def self.to_csv
    CSV.generate do |csv|
      

    end
  end


end
