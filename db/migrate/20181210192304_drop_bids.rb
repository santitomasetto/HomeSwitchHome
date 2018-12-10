class DropBids < ActiveRecord::Migration[5.2]
  def change
  	drop_table :bids
  end
end
