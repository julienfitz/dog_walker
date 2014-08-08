class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :rating
      t.integer :walker_id
      t.integer :owner_id
      
      t.timestamps
    end
  end
end
