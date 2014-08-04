class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.integer :pet_id
      t.string :supply
      t.string :location

      t.timestamps
    end
  end
end
