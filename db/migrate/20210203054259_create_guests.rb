class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :name, null: false
      t.string :name_kana, null: false
      t.date :birthday, null: false
      t.boolean :sex, default: true, null: false
      t.string :zipcode, null: false
      t.string :address, null: false
      t.string :email, null: false
      t.string :phone_number, null: false
      t.timestamps
    end
  end
end
