class AddDatesToRetreat < ActiveRecord::Migration[5.0]
  def change
    add_column :retreats, :start_date, :date
    add_column :retreats, :end_date, :date
    add_column :retreats, :available_spots, :integer
  end
end
