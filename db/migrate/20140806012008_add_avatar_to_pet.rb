class AddAvatarToPet < ActiveRecord::Migration
  def change
    add_column :pets, :avatar, :string
  end
end
