class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.integer :status, default: 0, null: false
      t.timestamps
    end
  end
end
