class Vet < ActiveRecord::Base
  has_many :pets
  validates_presence_of :name, :phone, :address

  def all_details
    "#{self.name} - #{self.phone} - #{self.address}"
  end

end
