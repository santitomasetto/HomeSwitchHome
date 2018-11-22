class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :in_date
      t.date :out_date
      t.integer :residence_id
      t.integer :user_id

      t.timestamps
    end
  end
end
