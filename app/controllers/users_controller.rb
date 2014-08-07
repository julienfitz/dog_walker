class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def show
    if @user.admin == true
      @users = User.all
      render "index.html.erb"
    elsif @user.walker == false
      @household = Household.find_by(email: @user.email)
      @user.assign_household(@household)
    else
      @household = Household.new
    end
  end

  def index
    redirect_to current_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :phone, :walker, :avatar, :admin)
    end
end
