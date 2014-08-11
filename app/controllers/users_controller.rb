class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show]

  def email
    @walker = User.find(params[:walker_id])

    respond_to do |format|
      UserMailer.new_client_email(@walker).deliver

      format.html { redirect_to root_path, notice: 'Your email has been sent.'}
    end
  end
  
  def show
    if @user.admin == true
      @walkers = User.where(:walker => true)
      @owners = User.where(:walker => false)
      @households = Household.all
      @vets = Vet.all
      @pets = Pet.all
      render "admin.html.erb"
    elsif @user.walker == false
      @household = Household.find_by(email: @user.email)
      @household.phone = @user.phone
      @household.save
      @user.assign_household(@household)
      @appointments = @user.household.pets.collect { |pet| pet.appointments }.flatten.sort_by { |appt| appt.date }
      @walkers = User.where(walker: true)
      @review = Review.new
    else
      @pets = @user.all_pets
      @appointments = @user.appointments.sort_by { |appt| appt.date }
      @appointment = Appointment.new
      @reviews = Review.where(:walker_id => current_user)
    end
  end

  def index
    if signed_in?
      redirect_to current_user
    else
      @user = User.new
      @walkers = User.where(:walker => true)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :phone, :walker, :avatar, :admin, :date, :walker_id, :owner_id)
    end
end
