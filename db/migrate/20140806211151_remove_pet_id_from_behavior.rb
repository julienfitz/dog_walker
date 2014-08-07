class RemovePetIdFromBehavior < ActiveRecord::Migration
  def change
    remove_column :behaviors, :pet_id, :integer
  end
end
