class AppointmentsController < ApplicationController

  def create
    binding.pry
    Time.zone = "EST"
    Chronic.time_class = Time.zone
    @appointment = Appointment.new(pet_id: appointment_params[:pet_id], walker_id: appointment_params[:walker_id])
    @date = Chronic.parse(appointment_params[:date])
    @appointment.date = @date
    @appointment.save
    redirect_to current_user
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to current_user
  end

  def show
    respond_to do |format|
    #format.html # new.html.erb
    #format.json { render json: @sale }
      format.js
    end
    redirect_to current_user
  end

  def send_text
    # @pet = Pet.find(appointment_params[:pet_id])
    # @user = User.find(@pet.household.owner_id)
    body = params[:text]
    @user = User.first
    @user.text_to_owner(body)
    redirect_to current_user
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:date, :pet_id, :walker_id, :fed, :pee, :pooped, :text, :household_id)
    end
end