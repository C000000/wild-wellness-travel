class AddPropertyToRetreats < ActiveRecord::Migration[5.0]
  def change
  	add_reference :retreats, :property, index: true, foreign_key: true
  end
end
