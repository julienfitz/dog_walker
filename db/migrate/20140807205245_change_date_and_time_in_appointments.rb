class ChangeDateAndTimeInAppointments < ActiveRecord::Migration
  def change
    remove_column :appointments, :day, :date
    remove_column :appointments, :time, :integer
    add_column :appointments, :date, :datetime
  end
end
