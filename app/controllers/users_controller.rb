class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!#, :except => [:index]
  
  def show
    if @user.admin == true
      @users = User.all
      @households = Household.all
      @pets = Pet.all
      render "index.html.erb"
    elsif @user.walker == false
      @household = Household.find_by(email: @user.email)
      @appointments = @user.household.pets.collect { |pet| pet.appointments }.first.sort_by { |appt| appt.date }
      @user.assign_household(@household)
      @walkers = User.where(walker: true)
      @review = Review.new
    else
      @pets = @user.all_pets
      @appointments = @user.appointments.sort_by { |appt| appt.date }
      @appointment = Appointment.new
    end
  end

  def index
    if signed_in?
      redirect_to current_user
    else
      @users = User.where(:walker => true)
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
