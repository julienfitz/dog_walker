class AppointmentsController < ApplicationController

  def modal
    @appointment = Appointment.find(params[:id])
  end

  def create
    Time.zone = "EST"
    Chronic.time_class = Time.zone
    @appointment = Appointment.new(pet_id: appointment_params[:pet_id], walker_id: appointment_params[:walker_id])
    @date = Chronic.parse(appointment_params[:date])
    @appointment.date = @date
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to current_user }
      else
        format.html { redirect_to current_user, notice: 'Please specify pet to make an appointment.' }
      end
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to current_user
  end

  def send_text
    @appointment = Appointment.find(params[:appt_id])
    @user = @appointment.pet.household.owner
    @phone = @appointment.pet.household.phone
    @body = params[:text] + "poop: #{params[:poop][:poop_quality]}"
    @user.text_to_owner(@body, @phone)
    @appointment.destroy
    redirect_to current_user
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:date, :pet_id, :walker_id, :fed, :pee, :pooped, :text, :household_id, :appt_id, :pet_name, poop:[])
    end
end