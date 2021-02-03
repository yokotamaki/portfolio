class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :room_id, null: false
      t.integer :guest_id, null: false
      t.integer :people, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.timestamps
    end
  end
end
