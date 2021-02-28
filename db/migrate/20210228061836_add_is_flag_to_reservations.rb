class AddIsFlagToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :is_flag, :boolean, default: true
  end
end
