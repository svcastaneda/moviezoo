class CreatePops < ActiveRecord::Migration
  def change
    create_table :pops do |t|
      t.integer :review_id
      t.integer :user_id
      t.integer :popped, default: 0

      t.timestamps null: false
    end
  end
end
