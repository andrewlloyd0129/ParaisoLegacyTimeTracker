class AddJobNameAndNumberToJob < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :JobNameAndNumber, :string, default: "change this"
  end
end
