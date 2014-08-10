class PoopsController < ApplicationController

  def create
    Time.zone = "EST"
    Chronic.time_class = Time.zone
    @poop = Poop.new(pet_id: poop_params[:pet_id], poop_quality: poop_params[:poop_quality], poop_datetime: poop_params[:poop_datetime])
    @date = Chronic.parse(poop_params[:poop_datetime])
    @poop.poop_datetime = @date
    @poop.save
  end

  def destroy
    @poop = Poop.find(params[:id])
    @poop.destroy
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:poop).permit(:poop_datetime, :pet_id, :walker_id)
    end

end
