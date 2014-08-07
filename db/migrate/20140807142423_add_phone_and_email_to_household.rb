class AddPhoneAndEmailToHousehold < ActiveRecord::Migration
  def change
    add_column :households, :phone, :string
    add_column :households, :email, :string
  end
end
