class AppointmentsController < ApplicationController

  def create
    Time.zone = "EST"
    Chronic.time_class = Time.zone
    @appointment = Appointment.new(appointment_params)
    @date = Chronic.parse(appointment_params[:date])
    @appointment.date = @date
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to current_user }
      else
        format.html { redirect_to current_user, notice: 'No appointment added to schedule - please select a pet to create an appointment.' }
      end
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to current_user
  end

  def update
    Time.zone = "EST"
    Chronic.time_class = Time.zone
    @appointment = Appointment.find(params[:id])
    @date = Chronic.parse(appointment_params[:date])
    @appointment.date = @date
    @appointment.save
    redirect_to current_user
  end

  def send_text
    @appointment = Appointment.find(params[:appt_id])
    @user = @appointment.pet.household.owner
    @phone = @appointment.pet.household.phone
    @walker = @appointment.pet.household.walker.name
    @fed = "fed," if params[:fed?]
    @pee = "peed," if params[:pee?]
    @poop = "pooped, poop:" if params[:poop?]
    @body = "#{params[:text]} - #{@fed} #{@pee} #{@poop} #{params[:poop][:poop_quality]} - #{@walker}"
    @user.text_to_user(@body, @phone)
    @appointment.destroy
    redirect_to current_user
  end

  def cancel
    @appointment = Appointment.find(params[:appt_id])
    @user = @appointment.pet.household.owner
    @phone = @appointment.pet.household.walker.phone
    @owner = @appointment.pet.household.owner.name
    @body = "#{params[:text]} -#{@owner}"
    @user.text_to_user(@body, @phone)
    @appointment.destroy
    redirect_to current_user
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:date, :pet_id, :walker_id, :fed, :pee, :pooped, :text, :household_id, :appt_id, :pet_name, poop:[])
    end
end