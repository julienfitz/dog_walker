class Vet < ActiveRecord::Base

  has_many :pets

  def all_details
    "#{self.name} - #{self.phone} - #{self.address}"
  end

end
