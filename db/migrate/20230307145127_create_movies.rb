class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.string :genre
      t.string :overview
      t.integer :rating
    
      t.timestamps
    end
  end
end
