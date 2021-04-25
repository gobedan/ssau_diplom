class CharacteristicsProductsController < ApplicationController
  before_action :set_characteristics_product, only: %i[ show edit update destroy ]

  # GET /characteristics_products or /characteristics_products.json
  def index
    @characteristics_products = CharacteristicsProduct.all
  end

  # GET /characteristics_products/1 or /characteristics_products/1.json
  def show
  end

  # GET /characteristics_products/new
  def new
    @characteristics_product = CharacteristicsProduct.new
  end

  # GET /characteristics_products/1/edit
  def edit
  end

  # POST /characteristics_products or /characteristics_products.json
  def create
    @characteristics_product = CharacteristicsProduct.new(characteristics_product_params)

    respond_to do |format|
      if @characteristics_product.save
        format.html { redirect_to @characteristics_product, notice: "Characteristics product was successfully created." }
        format.json { render :show, status: :created, location: @characteristics_product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @characteristics_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /characteristics_products/1 or /characteristics_products/1.json
  def update
    respond_to do |format|
      if @characteristics_product.update(characteristics_product_params)
        format.html { redirect_to @characteristics_product, notice: "Characteristics product was successfully updated." }
        format.json { render :show, status: :ok, location: @characteristics_product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @characteristics_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characteristics_products/1 or /characteristics_products/1.json
  def destroy
    @characteristics_product.destroy
    respond_to do |format|
      format.html { redirect_to characteristics_products_url, notice: "Characteristics product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_characteristics_product
      @characteristics_product = CharacteristicsProduct.find(params[:product_id])
    end

    # Only allow a list of trusted parameters through.
    def characteristics_product_params
      params.require(:characteristics_product).permit(:characteristic_id, :product_id, :value)
    end
end
