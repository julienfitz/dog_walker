class AddReviewIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :review_id, :text
  end
end
