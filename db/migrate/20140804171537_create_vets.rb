class CreateVets < ActiveRecord::Migration
  def change
    create_table :vets do |t|
      t.string :name
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
