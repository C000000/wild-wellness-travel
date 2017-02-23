class AddActiveToRetreatLeaders < ActiveRecord::Migration[5.0]
  def change
    add_column :retreat_leaders, :active, :boolean, :default => true
  end
end
