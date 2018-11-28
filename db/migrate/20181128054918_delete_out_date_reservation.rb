class DeleteOutDateReservation < ActiveRecord::Migration[5.2]
  def change
  	remove_column :reservations, :out_date
  end
end
