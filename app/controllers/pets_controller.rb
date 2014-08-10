class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /pets
  # GET /pets.json
  def index
    # restrict this to admin only access
    @pets = Pet.all
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
    @user = User.find(current_user.id)
    @household = Pet.find(params[:id]).household
    @poop = Poop.new
    @poops = @pet.poops.sort_by { |poop| poop.poop_datetime }
    if @user.walker == false
      @pets = @user.all_pets
    end
  end

  # GET /pets/new
  def new
    @pet = Pet.new
  end

  # GET /pets/1/edit
  def edit
    @household = Pet.find(params[:id]).household
    @user = User.find(current_user.id)
  end

  # POST /pets
  # POST /pets.json
  def create
    @pet = Pet.new(pet_params)
    # @pet.behavior = Behavior.create(pet_params[:behavior])
    # @pet.supply = Supply.create(pet_params[:supply])
    respond_to do |format|
      if @pet.save
        format.html { redirect_to current_user, notice: 'Pet was successfully added.' }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    @household = Pet.find(params[:id]).household
    @user = User.find(current_user.id)
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to user_path(current_user), notice: 'Pet was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'Pet was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:species, :name, :size, :household_id, :allergies, :age, :feeding, :notes, :avatar, :vet_id, :dog_aggro, :human_aggro, :supply, :behavior_notes, :vet_attributes => [:name, :phone, :address])
    end
end
