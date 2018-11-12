class AgregarPujaActualSubastas < ActiveRecord::Migration[5.2]
  def change
  	add_column :subasta, :puja, :float
  end
end
