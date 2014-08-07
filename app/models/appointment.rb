class Appointment < ActiveRecord::Base
  belongs_to :pet
  belongs_to :walker, class_name: "User"
end
