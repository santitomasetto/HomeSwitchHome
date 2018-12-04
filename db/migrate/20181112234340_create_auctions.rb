class CreateAuctions < ActiveRecord::Migration[5.2]
  def change
    create_table :auctions do |t|
      t.string :name
      t.date :date
      t.float :amount
      t.float :bid

      t.timestamps
    end
  end
end
