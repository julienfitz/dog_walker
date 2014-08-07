class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :household, foreign_key: "owner_id"
  has_many :households, foreign_key: "walker_id"
  has_many :pets, through: :household
  has_many :appointments, foreign_key: "walker_id"

  mount_uploader :avatar, AvatarUploader

  validates_integrity_of  :avatar
  validates_processing_of :avatar

  def assign_household(household)
    household.owner_id = self.id
    household.save
  end

end
