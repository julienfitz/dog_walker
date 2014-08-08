class AddPetIdToPoops < ActiveRecord::Migration
  def change
    add_column :poops, :pet_id, :integer
  end
end
