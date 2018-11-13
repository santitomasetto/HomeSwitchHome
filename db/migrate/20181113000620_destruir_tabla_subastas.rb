class DestruirTablaSubastas < ActiveRecord::Migration[5.2]
  def change
  	drop_table :subasta
  end
end
