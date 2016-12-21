class AddCompanyToRetreats < ActiveRecord::Migration[5.0]
  def change
  	add_reference :retreats, :company, index: true, foreign_key: true
  end
end
