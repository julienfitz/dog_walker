class Appointment < ActiveRecord::Base
  belongs_to :pet
  belongs_to :walker, class_name: "User"
  validates :pet_id, presence: true

  # def parse_date(appointment_params)
  # end
end
