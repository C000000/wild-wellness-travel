class CreateRetreats < ActiveRecord::Migration[5.0]
  def change
    create_table :retreats do |t|
      t.string :name
      t.string :country
      t.string :city
      t.string :state
      t.string :street_address
      t.string :phone_number
      t.string :email
      t.string :video
      t.decimal :price
      t.text :description
      t.references :company, foreign_key: true, index: true
      t.boolean :available, :default => true

      t.timestamps
    end
  end
end
