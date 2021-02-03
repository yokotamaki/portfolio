class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.text :body, null: false
      t.integer :price, null: false
      t.integer :people, null: false
      t.integer :capacity, null: false
      t.boolean :reserved_flag, default: false, null: false
      t.timestamps
    end
  end
end
