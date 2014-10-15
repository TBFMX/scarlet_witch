class HistorialDeComprasController < ApplicationController
  before_action :set_historial_de_compra, only: [:show, :edit, :update, :destroy]

  # GET /historial_de_compras
  # GET /historial_de_compras.json
  def index
    @historial_de_compras = HistorialDeCompra.all
  end

  # GET /historial_de_compras/1
  # GET /historial_de_compras/1.json
  def show
  end

  # GET /historial_de_compras/new
  def new
    @historial_de_compra = HistorialDeCompra.new
  end

  # GET /historial_de_compras/1/edit
  def edit
  end

  # POST /historial_de_compras
  # POST /historial_de_compras.json
  def create
    @historial_de_compra = HistorialDeCompra.new(historial_de_compra_params)

    respond_to do |format|
      if @historial_de_compra.save
        format.html { redirect_to @historial_de_compra, notice: 'Historial de compra was successfully created.' }
        format.json { render :show, status: :created, location: @historial_de_compra }
      else
        format.html { render :new }
        format.json { render json: @historial_de_compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historial_de_compras/1
  # PATCH/PUT /historial_de_compras/1.json
  def update
    respond_to do |format|
      if @historial_de_compra.update(historial_de_compra_params)
        format.html { redirect_to @historial_de_compra, notice: 'Historial de compra was successfully updated.' }
        format.json { render :show, status: :ok, location: @historial_de_compra }
      else
        format.html { render :edit }
        format.json { render json: @historial_de_compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historial_de_compras/1
  # DELETE /historial_de_compras/1.json
  def destroy
    @historial_de_compra.destroy
    respond_to do |format|
      format.html { redirect_to historial_de_compras_url, notice: 'Historial de compra was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historial_de_compra
      @historial_de_compra = HistorialDeCompra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historial_de_compra_params
      params.require(:historial_de_compra).permit(:nombre_generico, :description, :cantidad, :unidad, :precio, :multiplicador, :category_id, :origen)
    end
end
