class RemovePoopIdFromPets < ActiveRecord::Migration
  def change
    remove_column :pets, :poop_id, :integer
  end
end
