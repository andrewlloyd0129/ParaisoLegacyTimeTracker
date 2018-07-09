class CreatePayReports < ActiveRecord::Migration[5.1]
  def change
    create_table :pay_reports do |t|
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
