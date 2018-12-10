class CreateBids < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.integer :amount
      t.integer :user_id
      t.integer :auction_id

      t.timestamps
    end
  end
end
