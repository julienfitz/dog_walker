class AddReviewToUser < ActiveRecord::Migration
  def change
    add_column :users, :review, :text
  end
end
