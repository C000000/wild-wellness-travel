class AddActiveToRetreats < ActiveRecord::Migration[5.0]
  def change
    add_column :retreats, :active, :boolean, :default => true
  end
end
