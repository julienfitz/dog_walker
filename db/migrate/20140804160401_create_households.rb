class CreateHouseholds < ActiveRecord::Migration
  def change
    create_table :households do |t|
      t.string :address
      t.string :key_info
      t.integer :walker_id
      t.integer :owner_id

      t.timestamps
    end
  end
end
