class Poop < ActiveRecord::Base
  belongs_to :pet

  validates_presence_of :poop_quality
  validate :poop_datetime_cannot_be_in_the_future
 
  def poop_datetime_cannot_be_in_the_future
    if poop_datetime > Time.now
      errors.add(:poop_datetime, "can't be in the future")
    end
  end
end
