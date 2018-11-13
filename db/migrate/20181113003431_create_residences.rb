class CreateResidences < ActiveRecord::Migration[5.2]
  def change
    create_table :residences do |t|
      t.string :name
      t.string :country
      t.string :address
      t.integer :capacity
      t.string :photo

      t.timestamps
    end
  end
end
