class DeleteOutDateAuction < ActiveRecord::Migration[5.2]
  def change
  	remove_column :auctions, :out_date
  end
end
