class RemovePhotoFromPet < ActiveRecord::Migration
  def change
    remove_column :pets, :photo, :string
  end
end
