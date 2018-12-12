class CreateHotsales < ActiveRecord::Migration[5.2]
  def change
    create_table :hotsales do |t|
      t.date :in_date
      t.float :amount
      t.integer :residence_id
       t.timestamps
    end
  end
end