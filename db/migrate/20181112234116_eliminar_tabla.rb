class EliminarTabla < ActiveRecord::Migration[5.2]
  def change
  	drop_table :auctions
  end
end
