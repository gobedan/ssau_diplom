class CharacteristicsController < ApplicationController
  before_action :set_characteristic, only: %i[ show edit update destroy ]

  # GET /characteristics or /characteristics.json
  def index
    @characteristics = Characteristic.all
  end

  # GET /characteristics/1 or /characteristics/1.json
  def show
  end

  # GET /characteristics/new
  def new
    @characteristic = Characteristic.new
  end

  # GET /characteristics/1/edit
  def edit
  end

  # POST /characteristics or /characteristics.json
  def create
    @characteristic = Characteristic.new(characteristic_params)

    respond_to do |format|
      if @characteristic.save
        format.html { redirect_to @characteristic, notice: "Characteristic was successfully created." }
        format.json { render :show, status: :created, location: @characteristic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @characteristic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /characteristics/1 or /characteristics/1.json
  def update
    respond_to do |format|
      if @characteristic.update(characteristic_params)
        format.html { redirect_to @characteristic, notice: "Characteristic was successfully updated." }
        format.json { render :show, status: :ok, location: @characteristic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @characteristic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characteristics/1 or /characteristics/1.json
  def destroy
    @characteristic.destroy
    respond_to do |format|
      format.html { redirect_to characteristics_url, notice: "Characteristic was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_characteristic
      @characteristic = Characteristic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def characteristic_params
      params.require(:characteristic).permit(:name, :measure_unit_id, :subcategory_id)
    end
end
