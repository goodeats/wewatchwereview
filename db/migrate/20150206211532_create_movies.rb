class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :poster
      t.string :rotten_tomatoes_score
      t.string :genre
    end
  end
end
