class CreateClassifications < ActiveRecord::Migration
  def change
    create_table :classifications do |t|
      t.integer :movie_id
      t.integer :genre_id

      t.timestamps null: false
    end
  end
end
