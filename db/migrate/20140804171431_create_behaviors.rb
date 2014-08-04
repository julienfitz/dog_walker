class CreateBehaviors < ActiveRecord::Migration
  def change
    create_table :behaviors do |t|
      t.integer :pet_id
      t.boolean :dog_aggro
      t.boolean :human_aggro
      t.string :bad_habits

      t.timestamps
    end
  end
end
