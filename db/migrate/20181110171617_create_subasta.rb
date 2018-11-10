class CreateSubasta < ActiveRecord::Migration[5.2]
  def change
    create_table :subasta do |t|
      t.string :nombre
      t.integer :monto

      t.timestamps
    end
  end
end
