class DropBehaviorsTable < ActiveRecord::Migration
  def change
    drop_table :behaviors
  end
end
