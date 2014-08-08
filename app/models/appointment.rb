class Appointment < ActiveRecord::Base
  belongs_to :pet
  belongs_to :walker, class_name: "User"

  # def parse_date(appointment_params)
  # end
end
