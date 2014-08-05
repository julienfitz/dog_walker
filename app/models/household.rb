class Household < ActiveRecord::Base

  belongs_to :owner, class_name: "User"
  belongs_to :walker, class_name: "User"
  has_many :pets

  accepts_nested_attributes_for :owner
end
