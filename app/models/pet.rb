class Pet < ActiveRecord::Base
  belongs_to :household
  belongs_to :vet
  belongs_to :supply
  has_many :appointments
  has_many :poops

  accepts_nested_attributes_for :vet, :reject_if => lambda { |c| c[:name].blank? }

  validates_presence_of :name

  mount_uploader :avatar, AvatarUploader

  validates_integrity_of  :avatar
  validates_processing_of :avatar
end
