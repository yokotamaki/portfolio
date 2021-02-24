class AddCustomerIdToGuests < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :customer_id, :integer
  end
end
