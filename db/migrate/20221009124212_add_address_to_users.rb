class AddAddressToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :postal_number, :string
    add_column :users, :address, :string
    add_column :users, :introduction, :string
  end
end
