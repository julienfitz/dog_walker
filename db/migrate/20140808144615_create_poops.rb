class CreatePoops < ActiveRecord::Migration
  def change
    create_table :poops do |t|
      t.datetime :poop_datetime
      t.string :poop_quality

      t.timestamps
    end
  end
end
