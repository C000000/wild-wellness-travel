class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :phone_number, :string
    add_column :users, :gender, :string
    add_column :users, :country, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :street_address, :string
    add_column :users, :zip_code, :string
    add_column :users, :company_owner, :boolean, :default => false
  end
end
