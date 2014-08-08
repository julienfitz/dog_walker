class Pet < ActiveRecord::Base

  belongs_to :household
  belongs_to :vet

  accepts_nested_attributes_for :vet, :reject_if => lambda { |c| c[:name].blank? }


  mount_uploader :avatar, AvatarUploader

  validates_integrity_of  :avatar
  validates_processing_of :avatar
end
