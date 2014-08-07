class RemovePetIdFromSupply < ActiveRecord::Migration
  def change
    remove_column :supplies, :pet_id, :integer
  end
end
