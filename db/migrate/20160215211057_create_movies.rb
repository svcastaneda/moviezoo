class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :summary, null: false, unique: true
      t.integer :year, null: false

      t.timestamps null: false
    end
  end
end
