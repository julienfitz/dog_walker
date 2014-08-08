class DropSupplyIdFromPets < ActiveRecord::Migration
  def change
    remove_column :pets, :supply_id
  end
end
