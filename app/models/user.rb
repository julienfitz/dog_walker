class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :household, foreign_key: "owner_id"
  has_many :households, foreign_key: "walker_id"
  has_many :pets, through: :household
  has_many :appointments, foreign_key: "walker_id"
  has_many :reviews, foreign_key: "walker_id"
  has_many :reviews, foreign_key: "owner_id"

  validates_presence_of :name, :email

  mount_uploader :avatar, AvatarUploader

  validates_integrity_of  :avatar
  validates_processing_of :avatar

  def assign_household(household)
    household.owner_id = self.id
    household.save
  end

  def all_pets
    self.households.collect { |house| house.pets }.flatten
  end

  def pet_owner_name
    User.find(@user.reviews.owner_id).name
  end

  def text_to_user(body, phone)
    @client = Twilio::REST::Client.new(ENV['TWILIO_SID'],ENV['TWILIO_AUTH_TOKEN'])
    @client.account.messages.create(
      :from => '+18037674105',
      # :to => phone,
      :to => '9175581491',
      :body => body
    )
  end
end
