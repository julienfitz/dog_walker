class Pet < ActiveRecord::Base

  belongs_to :household
  has_one :behavior
  belongs_to :vet
  has_one :supply

end
