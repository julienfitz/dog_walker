class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :type
      t.string :name
      t.string :photo
      t.string :size
      t.integer :household_id
      t.string :allergies
      t.integer :vet_id
      t.string :age
      t.string :feeding
      t.string :notes

      t.timestamps
    end
  end
end
