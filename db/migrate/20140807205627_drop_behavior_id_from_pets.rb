class DropBehaviorIdFromPets < ActiveRecord::Migration
  def change
    remove_column :pets, :behavior_id
  end
end
