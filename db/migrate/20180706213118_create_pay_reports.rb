class CreatePayReports < ActiveRecord::Migration[5.1]
  def change
    create_table :pay_reports do |t|
      t.datetime :start_period
      t.datetime :end_period

      t.timestamps
    end
  end
end
