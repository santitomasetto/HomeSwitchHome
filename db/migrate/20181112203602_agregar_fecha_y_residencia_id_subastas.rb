class AgregarFechaYResidenciaIdSubastas < ActiveRecord::Migration[5.2]
  def change
  	add_column :subasta, :fecha, :date
  	add_column :subasta, :residencia_id, :integer
  end
end
