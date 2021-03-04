class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :room_id, null: false
      t.float :star, null: false
      t.string :name, null: false
      t.text :comment
      t.string :sex, null: false
      t.string :age, null: false
      t.timestamps
    end
  end
end
