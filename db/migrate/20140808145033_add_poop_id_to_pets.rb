class AddPoopIdToPets < ActiveRecord::Migration
  def change
    add_column :pets, :poop_id, :integer
  end
end
