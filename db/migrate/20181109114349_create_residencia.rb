class CreateResidencia < ActiveRecord::Migration[5.2]
  def change
    create_table :residencia do |t|
      t.string :nombre
      t.string :pais
      t.string :direccion
      t.integer :capacidad
      t.string :foto

      t.timestamps
    end
  end
end
