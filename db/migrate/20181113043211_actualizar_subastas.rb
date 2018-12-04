class ActualizarSubastas < ActiveRecord::Migration[5.2]
  def change
  	rename_column :auctions, :date, :in_date
  	add_column :auctions, :out_date, :date
  	add_column :auctions, :residence_id, :integer
  end
end
