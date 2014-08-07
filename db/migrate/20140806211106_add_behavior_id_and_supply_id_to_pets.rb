class AddBehaviorIdAndSupplyIdToPets < ActiveRecord::Migration
  def change
    add_column :pets, :behavior_id, :integer
    add_column :pets, :supply_id, :integer
  end
end
