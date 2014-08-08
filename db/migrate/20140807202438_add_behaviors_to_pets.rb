class AddBehaviorsToPets < ActiveRecord::Migration
  def change
    add_column :pets, :dog_aggro, :boolean
    add_column :pets, :human_aggro, :boolean
    add_column :pets, :behavior_notes, :string
  end
end
