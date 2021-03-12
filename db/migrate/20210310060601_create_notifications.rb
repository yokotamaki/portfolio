class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :reservation_id
      t.integer :contact_id
      t.integer :review_id
      t.string :action, null: false
      t.boolean :checked, null: false, default: false
      t.timestamps
    end
  end
end
