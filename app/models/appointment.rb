class Appointment < ActiveRecord::Base
  belongs_to :pet
  belongs_to :walker, class_name: "User"
  validates_presence_of :pet_id

end
