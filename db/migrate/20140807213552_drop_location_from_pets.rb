class DropLocationFromPets < ActiveRecord::Migration
  def change
    remove_column :pets, :location
  end
end
