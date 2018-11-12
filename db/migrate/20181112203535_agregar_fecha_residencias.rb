class AgregarFechaResidencias < ActiveRecord::Migration[5.2]
  def change
  	add_column :residencia, :fecha, :date
  end
end
