class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :plot
      t.integer :year, null: false
      t.string :poster
      t.string :imdb_id, null: false, index: true
      t.timestamps null: false
    end
  end
end
