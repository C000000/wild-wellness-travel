class CreateRetreatLeaders < ActiveRecord::Migration[5.0]
  def change
    create_table :retreat_leaders do |t|
    	t.string :first_name
    	t.string :last_name
      	t.text :biography
      	t.string :email
      	t.string :phone_number
      	t.references :retreat
      	
      	t.timestamps
    end
  end
end
