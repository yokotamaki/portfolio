class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :room_id, null: false
      t.float :star, null: false
      t.text :comment
      t.boolean :sex, null: false
      t.integer :age, default: 0, null: false
      t.timestamps
    end
  end
end
