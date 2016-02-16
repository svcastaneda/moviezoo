class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :movie_id
      t.string :body
      t.string :rating
      t.string :integer

      t.timestamps null: false
    end
  end
end
