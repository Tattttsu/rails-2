class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :total_price
      t.date :start_day
      t.date :finish_day
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
