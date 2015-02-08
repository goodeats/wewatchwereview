class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :body
      t.integer :rating
      t.string :recommendation
      t.boolean :spoiler?
    end
  end
end
