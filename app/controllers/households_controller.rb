class HouseholdsController < ApplicationController
  before_action :set_household, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /households
  # GET /households.json
  def index
     @user = User.find(params[:user_id])
     @households = @user.households
  end

  # GET /households/1
  # GET /households/1.json
  def show
    @user = User.find(params[:user_id])
    @pet = Pet.new
    @owner = User.find(@household.owner_id)
  end

  def register
  end

  # GET /households/new
  def new
    @user = User.find(params[:user_id])
    @household = Household.new
  end

  # GET /households/1/edit
  def edit
    @user = User.find(params[:user_id])
  end

  # POST /households
  # POST /households.json
  def create
    @household = Household.new(household_params)
    @household.walker_id = params[:user_id]
    respond_to do |format|
      if @household.save
        format.html { redirect_to user_path(current_user), notice: 'Household was successfully created.' }
        format.json { render :show, status: :created, location: @household }
      else
        format.html { render :new }
        format.json { render json: @household.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /households/1
  # PATCH/PUT /households/1.json
  def update
    raise params.inspect
    respond_to do |format|
      if @household.update(household_params)
        format.html { redirect_to user_path(current_user), notice: 'Household was successfully updated.' }
        format.json { render :show, status: :ok, location: @household }
      else
        format.html { render :edit }
        format.json { render json: @household.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /households/1
  # DELETE /households/1.json
  def destroy
    @household.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'Household was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_household
      @household = Household.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def household_params
      params.require(:household).permit(:address, :key_info, :user_id, :walker_id, :owner_name, :email, :phone)
    end
end
