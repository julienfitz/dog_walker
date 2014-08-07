class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :day
      t.integer :time
      t.integer :pet_id
      t.integer :walker_id

      t.timestamps
    end
  end
end
