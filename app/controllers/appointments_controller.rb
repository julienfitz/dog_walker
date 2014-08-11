class AppointmentsController < ApplicationController

  def create
    Time.zone = "EST"
    Chronic.time_class = Time.zone
    @appointment = Appointment.new(appointment_params)
    @date = Chronic.parse(appointment_params[:date])
    @appointment.date = @date
    respond_to do |format|
      if @appointment.save
        format.js 
      else
        format.js { render 'notice' }
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
    @walker = @appointment.pet.household.walker.name
    @fed = "fed," if params[:fed?]
    @pee = "peed," if params[:pee?]
    @poop = "pooped, poop:" if params[:poop?]
    @body = "#{params[:text]} - #{@fed} #{@pee} #{@poop} #{params[:poop][:poop_quality]} - #{@walker}"
    @user.text_to_user(@body, @phone)
    @appointment.destroy
    @poop = Poop.create(poop_datetime: @appointment.date, poop_quality: params[:poop][:poop_quality], pet_id: @appointment.pet.id)
    respond_to do |format|
      format.html { redirect_to current_user, notice: 'Your text was sent.' }
    end
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

  def update
    Time.zone = "EST"
    Chronic.time_class = Time.zone
    @appointment = Appointment.find(params[:id])
    @date = Chronic.parse(appointment_params[:date])
    @appointment.date = @date
    @appointment.save
    redirect_to current_user
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:date, :pet_id, :walker_id, :fed, :pee, :pooped, :text, :household_id, :appt_id, :pet_name, poop:[])
    end
end