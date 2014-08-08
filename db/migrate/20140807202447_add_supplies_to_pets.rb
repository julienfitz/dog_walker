class AddSuppliesToPets < ActiveRecord::Migration
  def change
    add_column :pets, :supply, :string
    add_column :pets, :location, :string
  end
end
