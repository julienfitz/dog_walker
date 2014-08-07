class Pet < ActiveRecord::Base

  belongs_to :household
  belongs_to :behavior
  belongs_to :vet
  belongs_to :supply

  accepts_nested_attributes_for :vet, :supply, :behavior, :reject_if => lambda { |c| c[:name].blank? }

  mount_uploader :avatar, AvatarUploader

  validates_integrity_of  :avatar
  validates_processing_of :avatar
end
