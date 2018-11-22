class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :mail
      t.date :birthdate
      t.string :password
      t.integer :card_number
      t.integer :card_security_number
      t.date :card_vto

      t.timestamps
    end
  end
end
