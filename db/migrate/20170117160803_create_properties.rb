class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :type
      t.integer :guest_number
      t.string :country
      t.string :state
      t.string :city
      t.string :street_address
      t.string :phone_number
      t.string :email
      t.references :user

      t.timestamps
    end
  end
end
