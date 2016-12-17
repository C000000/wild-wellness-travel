class AddCoordinatesToRetreat < ActiveRecord::Migration[5.0]
  def change
    add_column :retreats, :latitude, :float
    add_column :retreats, :longitude, :float
  end
end
