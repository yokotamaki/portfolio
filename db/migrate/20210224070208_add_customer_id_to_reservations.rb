class AddCustomerIdToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :customer_id, :integer
  end
end
