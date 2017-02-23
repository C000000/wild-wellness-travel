class AddActiveToProperties < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :active, :boolean, :default => true
  end
end
