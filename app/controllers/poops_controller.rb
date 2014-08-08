class PoopsController < ApplicationController

  def create
    Time.zone = "EST"
    Chronic.time_class = Time.zone
    @poop = Poop.new(pet_id: poop_params[:pet_id], walker_id: poop_params[:walker_id], owner_id: poop_params[:owner_id])
    @date = Chronic.parse(appointment_params[:poop_datetime])
    @poop.date = @date
    @poop.save
    redirect_to current_user
  end

  def destroy
    @poop = Poop.find(params[:id])
    @poop.destroy
    redirect_to current_user
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:poop).permit(:poop_datetime, :pet_id, :walker_id)
    end

end
