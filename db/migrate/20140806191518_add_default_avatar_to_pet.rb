class AddDefaultAvatarToPet < ActiveRecord::Migration
  def change
        change_column :pets, :avatar, :string, default: "dog_bounty.jpg"
  end
end
