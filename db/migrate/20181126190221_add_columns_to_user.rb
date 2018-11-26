class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :name, :string
  	add_column :users, :birthdate, :date
  	add_column :users, :card_number, :string
  	add_column :users, :card_security_number, :integer
  	add_column :users, :card_vto, :date
  	add_column :users, :premium, :boolean
  	add_column :users, :admin, :boolean
  end
end
