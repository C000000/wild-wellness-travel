class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :country
      t.string :city
      t.string :state
      t.string :street_address
      t.string :email
      t.string :phone_number
      t.text :description
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
