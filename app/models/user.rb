class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pets, through: :household
  has_one :household, foreign_key: "owner_id"
  has_many :households, foreign_key: "walker_id"

end
