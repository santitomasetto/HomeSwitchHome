class EliminarNombreAuctions < ActiveRecord::Migration[5.2]
  def change
  	remove_column :auctions, :name
  end
end
